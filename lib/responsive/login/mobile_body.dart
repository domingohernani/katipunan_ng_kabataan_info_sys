import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginMobileBody extends StatelessWidget {
  const LoginMobileBody({super.key, required this.buildContext});
  final BuildContext buildContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "lib/assets/youth1.png",
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "Login",
            style: TextStyle(
              fontFamily: "BeVietnamPro",
              fontWeight: FontWeight.w800,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 3.0,
          ),
          const Text(
            "Enter your details below to access your account",
            style: TextStyle(
              fontFamily: "BeVietnamPro",
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Text(
            'Username',
            style: TextStyle(
              fontFamily: "BeVietnamPro",
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 245, 245, 245), // Background color
              borderRadius: BorderRadius.circular(5.0), // Rounded corners
            ),
            child: TextFormField(
              style: const TextStyle(
                fontFamily: "BeVietnamPro",
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              decoration: const InputDecoration(
                prefixIcon: IconButton(
                  onPressed: null,
                  icon: FaIcon(
                    FontAwesomeIcons.user,
                    size: 12,
                  ),
                ),
                border: InputBorder.none, // Removes the border
                contentPadding:
                    EdgeInsets.all(16.0), // Adds padding inside the text field
                hintText: 'Enter your username', // Hint text
                hintStyle: TextStyle(color: Colors.blueGrey), // Hint text color
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Text(
            'Password',
            style: TextStyle(
              fontFamily: "BeVietnamPro",
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 245, 245, 245), // Background color
              borderRadius: BorderRadius.circular(10.0), // Rounded corners
            ),
            child: TextFormField(
              style: const TextStyle(
                fontFamily: "BeVietnamPro",
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              decoration: const InputDecoration(
                prefixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.lock_outline),
                  iconSize: 12,
                ),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: FaIcon(FontAwesomeIcons.eye),
                  iconSize: 12,
                ),
                border: InputBorder.none, // Removes the border
                contentPadding:
                    EdgeInsets.all(16.0), // Adds padding inside the text field
                hintText: 'Enter your password', // Hint text
                hintStyle: TextStyle(color: Colors.blueGrey), // Hint text color
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          TextButton(
            onPressed: () {
              // Your onPressed code here
            },
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                fontFamily: "BeVietnamPro",
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              backgroundColor: const Color(0xFF2d55ff), // Background color
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0, horizontal: 16.0), // Button padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0), // Roundness
              ),
            ),
            child: Row(
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
                    fontFamily: "BeVietnamPro",
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    )
        // backgroundColor: Colors.blue,
        );
  }
}
