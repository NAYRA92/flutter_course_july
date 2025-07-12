import 'package:flutter/material.dart';
import 'package:flutter_course_july/constant.dart';

import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg_image.png"),
            fit: BoxFit.cover,)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset("images/single_logo.png"),
              SizedBox(height: 20,),
              Text("Welcome\nto Our Store",
              textAlign: TextAlign.center,
              style: app_text_style().copyWith(
                fontSize: 48
              ),),
              Text("We help people to find their best products",
              style: app_text_style()
              .copyWith(
                fontWeight: FontWeight.w200,
              ),),
              SizedBox(height: 20,),
              app_ele_button("Get Started", (){
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => HomeScreen()));
              }),
              SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}