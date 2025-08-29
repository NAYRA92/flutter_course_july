// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_course_july/bottom_nav_screens/cart_page.dart';
import 'package:flutter_course_july/bottom_nav_screens/explore_page.dart';
import 'package:flutter_course_july/bottom_nav_screens/fav_page.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import 'constant.dart';
import 'product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  final String user_name;
  const HomeScreen({super.key, required this.user_name});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int cartCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 8, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome, \n ${widget.user_name}!",
                      style: app_boldText_style(),
                    ),
                
                    //for logo and location
                    Column(
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
                      ],
                    ),
                  ],
                ),
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
                    app_items_card(
                      "images/banana.jpg",
                      "Organic Bananas",
                      "7pcs, Pricing",
                      "4.99",
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen()));
                      },
                    ),
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
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [],
                ),
              ),

              //groceries items
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
                      "Groceries",
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
                    ),
                  ],
                ),
              ),
              //gorceries list items
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    groceries_list_items("basket", "Mixed Fruit", 0xfff8a44c),
                    groceries_list_items("basket", "Milk & Chees", 0xff53b175),
                    groceries_list_items("basket", "Rice", 0xff125be),
                  ],
                ),
              ),

              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ),

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
            if (_selectedIndex == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ExplorePage()));
            } else if (_selectedIndex == 2) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            } else if (_selectedIndex == 3) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FavPage()));
            }
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(LucideIcons.store), label: "Shop"),
            BottomNavigationBarItem(
                icon: Icon(LucideIcons.search), label: "Explore"),
            BottomNavigationBarItem(
                icon: Icon(LucideIcons.shoppingCart), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(LucideIcons.heart), label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(LucideIcons.user), label: "Account")
          ]),
    );
  }

  Container groceries_list_items(
      String imageUrl, String title, int color_code) {
    return Container(
      height: 100,
      width: 250,
      margin: EdgeInsets.only(top: 25, bottom: 25, left: 5, right: 5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(color_code).withOpacity(0.15),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Image.asset("images/$imageUrl.png"),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: app_boldText_style().copyWith(fontSize: 18),
          )
        ],
      ),
    );
  }

  Row addCartItemsCount(StateSetter setState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            child: app_ele_button("-", () {
          if (cartCount > 1) {
            setState(() {
              cartCount--;
            });
          }
        })),
        Expanded(
            child: Center(
          child: Text(
            "$cartCount",
            style: app_text_style().copyWith(color: Colors.black, fontSize: 18),
          ),
        )),
        Expanded(
            child: app_ele_button("+", () {
          if (cartCount < 10) {
            setState(() {
              cartCount++;
            });
          }
        }))
      ],
    );
  }
}
