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
