

import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 85.0, left: 45.0, right: 45.0),
      child: Image.asset('assets/logo.png', width: 200, fit: BoxFit.contain),
    );
  }
}
