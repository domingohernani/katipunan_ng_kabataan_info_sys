import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kk_information_system/screens/login.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white, // Change this to the desired color
          statusBarBrightness:
              Brightness.dark, // For iOS (light text color for dark background)
          statusBarIconBrightness: Brightness
              .dark, // For Android (light text color for dark background)
          systemNavigationBarColor:
              Colors.white, // Change this to the desired color
          systemNavigationBarIconBrightness:
              Brightness.dark, // For Android (light icons for dark background)
        ),
        child: Login(),
      ),
    );
  }
}
