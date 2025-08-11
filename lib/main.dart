import 'package:flutter/material.dart';

import 'bottom_nav_screens/account_page.dart';
import 'bottom_nav_screens/cart_page.dart';
import 'bottom_nav_screens/fav_page.dart';
import 'order_accepted_screen.dart';
import 'training files/bottom_nav_bar_example.dart';
import 'splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, //to remove the debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Gilroy"
      ),
      
      home: CartPage()
      //  SplashScreen()
    );
  }
}
