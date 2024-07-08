import 'package:flutter/material.dart';
import 'package:kk_information_system/screens/home.dart';
import 'package:kk_information_system/screens/login.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    if (authService.user == null) {
      return const Login();
    } else {
      return const Home();
    }
  }
}
