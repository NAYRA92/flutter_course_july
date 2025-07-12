// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
             backgroundColor: Colors.amber, 
             radius: 90,
             backgroundImage: NetworkImage("https://images.ctfassets.net/23aumh6u8s0i/4TsG2mTRrLFhlQ9G1m19sC/4c9f98d56165a0bdd71cbe7b9c2e2484/flutter"),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                myText("Nayra Hashem", Colors.blue),
                myText("779055730", Colors.blue)
              ],
            ),
            myText("Location: Aden", Colors.amber[600]),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: myText("""
Bio: text text
text text text text text text text text text text text text text text text text text text
text text text text text text text text text text text text text text text text text text
text text text text text text text text text text text text text text text text text text
            """, Colors.black),
            ),
            myText("Skills: 123", Colors.black),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: (){}, 
              child: Text("Edit Profile"))
          ],
        ),
      ),
    );
  }

Widget myText (
  String txt,
  Color? clr
){
 return Text(
  txt,
  style: TextStyle(
    fontSize: 24,
    color: clr,
    fontWeight: FontWeight.w400
  ),
 );
}
}