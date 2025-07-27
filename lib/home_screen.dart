// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_course_july/bottom_nav_screens/cart_page.dart';
import 'package:flutter_course_july/bottom_nav_screens/explore_page.dart';
import 'package:flutter_course_july/bottom_nav_screens/fav_page.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import 'constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "images/single_logo.png",
                color: Colors.orange,
              ),
              Text(
                "Aden, Yemen",
                style: app_text_style().copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: greyTextColor),
              ),

              // Carousel View items
              SizedBox(
                height: 150,
                child: CarouselView(itemExtent: 400, children: [
                  myCarouselContainer("images/banana.jpg"),
                  myCarouselContainer("images/apple.jpg"),
                  myCarouselContainer("images/banana.jpg"),
                ]),
              ),

              // Exclusive Offers items
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "Exclusive Offer",
                      style: app_text_style().copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Text(
                      "See all",
                      style: app_text_style().copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: primaryColor),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 280,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    app_items_card("images/banana.jpg", "Organic Bananas",
                        "7pcs, Pricing", "4.99"),
                    app_items_card("images/apple.jpg", "Fresh Apple",
                        "1kg, Pricing", "6.00"),
                    app_items_card("images/apple.jpg", "Fresh Apple",
                        "1kg, Pricing", "6.00"),
                  ],
                ),
              ),

              //best selling items
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "Best Selling",
                      style: app_text_style().copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Text(
                      "See all",
                      style: app_text_style().copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: primaryColor),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 280,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    app_items_card("images/banana.jpg", "Organic Bananas",
                        "7pcs, Pricing", "4.99"),
                    app_items_card("images/apple.jpg", "Fresh Apple",
                        "1kg, Pricing", "6.00"),
                    app_items_card("images/apple.jpg", "Fresh Apple",
                        "1kg, Pricing", "6.00"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      //water drop nav bar
      // bottomNavigationBar: WaterDropNavBar(
      //   barItems: [
      //     BarItem(
      //       filledIcon: Icons.shop,
      //       outlinedIcon: Icons.shop_outlined
            
      //     ),
      //     BarItem(
      //       filledIcon: Icons.shopping_cart,
      //       outlinedIcon: Icons.shopping_cart_outlined
            
      //     ),
      //     BarItem(
      //       filledIcon: Icons.person,
      //       outlinedIcon: Icons.person_outlined
            
      //     ),
      //   ], 
      //   selectedIndex: _selectedIndex, 
      //   onItemSelected: (value){
      //     setState(() {
      //       _selectedIndex = value;
      //     });
      //   }),

      //bottom nav bar
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: primaryColor,
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
            //if statement
            if(_selectedIndex == 1){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=> ExplorePage()));
            }
            else if(_selectedIndex == 2){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=> CartPage()));
            }
            else if(_selectedIndex == 3){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=> FavPage()));
            }
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
