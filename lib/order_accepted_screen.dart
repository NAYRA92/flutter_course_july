import 'package:flutter/material.dart';
import 'package:flutter_course_july/constant.dart';
import 'package:flutter_course_july/home_screen.dart';
import 'package:lottie/lottie.dart';

class OrderAcceptedScreen extends StatelessWidget {
  const OrderAcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Lottie.asset("images/Success.json", height: 240),
          Text("Your Order has been accepted",
          textAlign: TextAlign.center,
          style: app_text_style().copyWith(
            color: Colors.black,
            fontSize: 28,
          ),),

          Text("Your items has been placcd and is on it’s way to being processed",
          textAlign: TextAlign.center,
          style: app_text_style().copyWith(
            color: greyTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 16
          ),),
          SizedBox(
            height: 50,
          ),

          //Track order button
          app_ele_button("Track Order", (){}),
          SizedBox(
            height: 10,
          ),
          
          //Back home button
          TextButton(onPressed: (){
            Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context) => HomeScreen()));
          }, child: Text("Back to home",
          style: app_text_style().copyWith(
            color: Colors.black,
            fontSize: 18
          )
          ,))
        ],),
      ),
    );
  }
}