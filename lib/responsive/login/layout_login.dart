import 'package:flutter/material.dart';

class LayoutLogin extends StatelessWidget {
  const LayoutLogin(
      {super.key,
      required this.mobileBody,
      required this.tabletBody,
      required this.desktopBody});
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return mobileBody;
        } else if (constraints.maxWidth < 800) {
          return tabletBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
