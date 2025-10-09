
import 'package:flutter/material.dart';

import '../home_screen_mysql.dart';
import 'ai_chat_page.dart';


// void main() {
//   runApp(const MyApp());
// }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp( //unerror will appear here, but it will go as soon as you import the needed Firebase packages
  //     options: const FirebaseOptions(
  //         apiKey: "AIzaSyCQYDUn2rw4h1HuNS-cL4EYaW7uIUfoR04", //you will find apiKey, appId ... etc indside the google-services.json file that you download from firebase console!
  //         appId: "632527793225",
  //         messagingSenderId: "sendid",
  //         projectId: "flutter-course-july",
  //         storageBucket: "flutter-course-july.firebasestorage.app")); 
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
      // AiChatPage()
       HomeScreenMysql(
        user_name: "Nayra",
      )
    );
  }
}
