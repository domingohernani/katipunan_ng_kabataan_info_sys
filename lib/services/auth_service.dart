import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kk_information_system/components/toast_notification.dart';
import 'package:kk_information_system/screens/home.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  AuthService() {
    // Listen for authentication state changes
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  User? get user => _user;

  Future<void> signup({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Navigate to Home after successful signup
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (BuildContext context) => const Home()),
      // );
    } on FirebaseAuthException catch (e) {
      String title = "Error";
      String body = "";

      if (e.code == "weak-password") {
        title = "Weak Password";
        body = "The provided password is too weak.";
      } else if (e.code == "email-already-in-use") {
        title = "Email Already In Use";
        body = "An account with that email already exists.";
      } else {
        title = "Unexpected Error";
        body = "An unknown error occurred.";
      }
      ToastNotification toast = ToastNotification(title: title, body: body);
      toast.warning();
    } catch (e) {
      String title = "Unexpected Error";
      String body = "The account could not be created due to an error.";
      ToastNotification toast = ToastNotification(title: title, body: body);
      toast.warning();
    }
  }

  Future<void> signin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Do not navigate from here, let AuthWrapper handle it
    } on FirebaseAuthException catch (e) {
      String title = "Error";
      String body = "";
      if (e.code == "user-not-found") {
        title = "User Not Found";
        body = "No account found for the provided email.";
      } else if (e.code == "wrong-password") {
        title = "Incorrect Email and/or Password";
        body = "The email and/or password you entered is incorrect.";
      } else {
        title = "Unexpected Error";
        body = e.message ?? "An unknown error occurred.";
      }
      print("Code" + e.code);
      print("Message" + e.message!);
      ToastNotification toast = ToastNotification(title: title, body: body);
      toast.warning();
    } catch (e) {
      String title = "Unexpected Error";
      String body = "The account could not be accessed because of an error.";
      ToastNotification toast = ToastNotification(title: title, body: body);
      toast.warning();
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }

  void _onAuthStateChanged(User? user) {
    _user = user;
    notifyListeners();
  }
}
