import 'package:flutter/material.dart';
import 'package:kk_information_system/responsive/login/desktop_body.dart';
import 'package:kk_information_system/responsive/login/layout_login.dart';
import 'package:kk_information_system/responsive/login/mobile_body.dart';
import 'package:kk_information_system/responsive/login/tablet_body.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutLogin(
          mobileBody: LoginMobileBody(
            buildContext: context,
          ),
          tabletBody: LoginTabletBody(),
          desktopBody: LoginDesktopBody(),
        ),
      ),
    );
  }
}
