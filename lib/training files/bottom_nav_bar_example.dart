import 'package:flutter/material.dart';
import 'package:flutter_course_july/constant.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class BottomNavBarExample extends StatefulWidget {
  const BottomNavBarExample({super.key});

  @override
  State<BottomNavBarExample> createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
  int _selectedIndex = 0;

  Widget myBodyWidget = Container(color: primaryColor,);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //body widget
      body: myBodyWidget,

      //bottom nav bar
       bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: primaryColor,
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
            //if statements
            if(_selectedIndex == 1){
              setState(() {
                myBodyWidget = Container(color: Colors.blue,);
              });
            }
            else if(_selectedIndex == 2){
              setState(() {
                myBodyWidget = Container(color: Colors.red,);
              });
            }
            else if(_selectedIndex == 3){
              setState(() {
                myBodyWidget = Container(color: Colors.orange,);
              });
            }
            else if(_selectedIndex == 4){
              setState(() {
                myBodyWidget = Container(color: Colors.pinkAccent,);
              });
            }
            else {
              setState(() {
                myBodyWidget = Container(color: primaryColor,);
              });
            }
            //end of if statement
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(LucideIcons.store), label: "Shop"),
            BottomNavigationBarItem(icon: Icon(LucideIcons.search), label: "Explore"),
            BottomNavigationBarItem(
                icon: Icon(LucideIcons.shoppingCart), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(LucideIcons.heart), label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(LucideIcons.user), label: "Account")
          ]),
    );
  }
}