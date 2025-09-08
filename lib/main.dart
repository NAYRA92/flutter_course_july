import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_july/bottom_nav_screens/login_page.dart';

import 'bottom_nav_screens/account_page.dart';
import 'bottom_nav_screens/cart_page.dart';
import 'bottom_nav_screens/explore_page.dart';
import 'bottom_nav_screens/fav_page.dart';
import 'bottom_nav_screens/register_page.dart';
import 'curd_product_page.dart';
import 'order_accepted_screen.dart';
import 'product_details_screen.dart';
import 'training files/bottom_nav_bar_example.dart';
import 'splash_screen.dart';


// void main() {
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( //unerror will appear here, but it will go as soon as you import the needed Firebase packages
      options: const FirebaseOptions(
          apiKey: "AIzaSyCQYDUn2rw4h1HuNS-cL4EYaW7uIUfoR04", //you will find apiKey, appId ... etc indside the google-services.json file that you download from firebase console!
          appId: "632527793225",
          messagingSenderId: "sendid",
          projectId: "flutter-course-july",
          storageBucket: "flutter-course-july.firebasestorage.app")); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Awesome Market',
      debugShowCheckedModeBanner: false, //to remove the debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 245, 236, 154)),
        useMaterial3: true,
        fontFamily: "Gilroy"
      ),
      
      home: 
      //ProductDetailsScreen()
       CurdProductPage()
    );
  }
}
