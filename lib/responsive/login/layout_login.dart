import 'package:flutter/material.dart';

class LayoutLogin extends StatelessWidget {
  const LayoutLogin(
      {super.key, required this.mobileBody, required this.desktopBody});
  final Widget mobileBody;
  final Widget desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return mobileBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
