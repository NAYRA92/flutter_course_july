import 'package:flutter/material.dart';

import '../constant.dart';
import '../home_screen.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  List<String> cartItemsTitle = [
    "Organic Bananas", //indexed 0
    "Fresh Apples", //indexed 1
  ];

  List<String> cartItemsImages = [
    "images/banana.jpg", //indexed 0
    "images/apple.jpg", //indexed 1
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favorites"),
        centerTitle: true,
      ),

      //our cart body
      body: ListView.builder(
        itemCount: cartItemsTitle.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: app_items_card(cartItemsImages[index],
                          cartItemsTitle[index], "7pcs, Pricing", "4.99", () {
                        //this is for adding items to cart
                        //but here an example for the alert dialog
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Center(child: Text("Oops! Order Failed")),
                                content: SizedBox(
                                  height: 350,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.close_rounded,
                                        size: 150,
                                        color: Colors.red[400],
                                      ),
                                      Text("Something went tembly wrong.",
                                      style: app_text_style().copyWith(
                                        color: greyTextColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16
                                      ),),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      
                                      //Try again button
                                      app_ele_button("Please Try Again", () {}),
                                      SizedBox(
                                        height: 10,
                                      ),
                                  
                                      //Back home button
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen()));
                                          },
                                          child: Text(
                                            "Back to home",
                                            style: app_text_style().copyWith(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            });
                      }),
                    ),
                    IconButton(
                        onPressed: () {
                          //deletion code
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ))
                  ],
                ),
              ),

              //divider
              Divider(
                indent: 30,
                endIndent: 30,
                thickness: 2,
                color: primaryColor,
              )
            ],
          );
          // Text("Item $index in Cart");
        },
      ),
    );
  }
}
