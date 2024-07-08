import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          toastification.show(
            context: context, // optional if you use ToastificationWrapper
            title: Text('Hello, world!'),
            autoCloseDuration: const Duration(seconds: 5),
            applyBlurEffect: true,
          );
        },
        child: Text("Show"),
      ),
    );
  }
}
