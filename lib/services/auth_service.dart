import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
      String message = "";
      if (e.code == "weak-password") {
        message = "The provided password is too weak.";
      } else if (e.code == "email-already-in-use") {
        message = "An account with that email already exists.";
      } else {
        message = e.message!;
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "The account could not be created due to an error.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
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
      String message = "";
      if (e.code == "user-not-found") {
        message = "No account found for the provided email.";
      } else if (e.code == "wrong-password") {
        message = "The email and/or password you entered is incorrect.";
      } else {
        message = e.message!;
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "The account could not be created due to an error.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }

  void _onAuthStateChanged(User? user) {
    _user = user;
    print('Auth State Changed: $user');
    notifyListeners();
  }
}
