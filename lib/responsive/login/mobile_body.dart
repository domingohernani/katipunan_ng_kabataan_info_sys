import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kk_information_system/components/toast_notification.dart';
import 'package:kk_information_system/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginMobileBody extends StatefulWidget {
  const LoginMobileBody({super.key, required this.buildContext});
  final BuildContext buildContext;

  @override
  State<LoginMobileBody> createState() => _LoginMobileBodyState();
}

class _LoginMobileBodyState extends State<LoginMobileBody> {
  TextEditingController emailCtrl = TextEditingController();

  TextEditingController passwordCtrl = TextEditingController();

  void loginBtnClicked() async {
    print(emailCtrl.text);
    print(passwordCtrl.text);

    if (emailCtrl.text.toString().trim() != "" &&
        passwordCtrl.text.toString().trim() != "") {
      final authService = Provider.of<AuthService>(context, listen: false);
      await authService.signin(
          email: emailCtrl.text, password: passwordCtrl.text, context: context);
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
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "lib/assets/youth_green.png",
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              "Login",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 3.0,
            ),
            const Text(
              "Enter your details below to access your account",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              'Email',
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 245, 245, 245), // Background color
                borderRadius: BorderRadius.circular(5.0), // Rounded corners
              ),
              child: TextFormField(
                controller: emailCtrl,
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                decoration: const InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: null,
                    icon: FaIcon(
                      FontAwesomeIcons.user,
                      size: 14,
                    ),
                  ),
                  border: InputBorder.none, // Removes the border
                  contentPadding: EdgeInsets.all(
                      16.0), // Adds padding inside the text field
                  hintText: 'Enter your email', // Hint text
                  hintStyle:
                      TextStyle(color: Colors.blueGrey), // Hint text color
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              'Password',
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 245, 245, 245), // Background color
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
              ),
              child: TextFormField(
                controller: passwordCtrl,
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                decoration: const InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.lock_outline),
                    iconSize: 16,
                  ),
                  suffixIcon: IconButton(
                    onPressed: null,
                    icon: FaIcon(FontAwesomeIcons.eye),
                    iconSize: 14,
                  ),
                  border: InputBorder.none, // Removes the border
                  contentPadding: EdgeInsets.all(
                      16.0), // Adds padding inside the text field
                  hintText: 'Enter your password', // Hint text
                  hintStyle:
                      TextStyle(color: Colors.blueGrey), // Hint text color
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            TextButton(
              onPressed: loginBtnClicked,
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                backgroundColor:
                    Theme.of(context).primaryColor, // Background color
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 16.0), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0), // Roundness
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min, // To wrap the content tightly
                children: [
                  Icon(
                    Icons.login, // Replace with your desired icon
                    color: Colors.white, // Icon color
                    size: 16, // Icon size
                  ),
                  SizedBox(width: 8), // Space between icon and text
                  Text(
                    "Log In",
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    )
        // backgroundColor: Colors.blue,
        );
  }
}
