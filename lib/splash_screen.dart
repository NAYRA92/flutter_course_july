import 'package:flutter/material.dart';

import 'constant.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context) => const OnboardingScreen()));
    });
    return Scaffold (
      backgroundColor: primaryColor,
      body: Center(
        child: Image.asset("images/logo.png")),
    );
  }
}