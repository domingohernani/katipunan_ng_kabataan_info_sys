import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kk_information_system/components/toast_notification.dart';
import 'package:kk_information_system/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginDesktopBody extends StatefulWidget {
  const LoginDesktopBody({super.key});

  @override
  State<LoginDesktopBody> createState() => _LoginDesktopBodyState();
}

class _LoginDesktopBodyState extends State<LoginDesktopBody> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  void loginBtnClicked() async {
    if (emailCtrl.text.trim() != "" && passwordCtrl.text.trim() != "") {
      final authService = Provider.of<AuthService>(context, listen: false);
      await authService.signin(
        email: emailCtrl.text,
        password: passwordCtrl.text,
        context: context,
      );
    } else {
      String title = "Missing Information";
      String body = "Both fields are necessary to complete the login process";
      ToastNotification toast = ToastNotification(title: title, body: body);
      toast.error();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Image Container
          Expanded(
            flex: 1,
            child: Container(
              child: Image.asset(
                "lib/assets/group_logo.png",
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ),
          // Login Form Container
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(70.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  const Text(
                    "Enter your details below to access your account",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 245, 245, 245), // Background color
                    ),
                    child: TextFormField(
                      controller: emailCtrl,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          FontAwesomeIcons.user,
                          size: 14,
                        ),
                        border: InputBorder.none, // Removes the border
                        contentPadding: EdgeInsets.all(
                            16.0), // Adds padding inside the text field
                        hintText: 'Enter your email', // Hint text
                        hintStyle: TextStyle(
                            color: Colors.blueGrey), // Hint text color
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 245, 245, 245), // Background color
                    ),
                    child: TextFormField(
                      controller: passwordCtrl,
                      obscureText: true, // Hide the password text
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          size: 16,
                        ),
                        suffixIcon: Icon(
                          FontAwesomeIcons.eye,
                          size: 14,
                        ),
                        border: InputBorder.none, // Removes the border
                        contentPadding: EdgeInsets.all(
                            16.0), // Adds padding inside the text field
                        hintText: 'Enter your password', // Hint text
                        hintStyle: TextStyle(
                            color: Colors.blueGrey), // Hint text color
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextButton(
                    onPressed: loginBtnClicked,
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 30.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.login,
                          color: Colors.white, // Icon color
                          size: 16, // Icon size
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Log In",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
