import 'package:flutter/material.dart';

import 'constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/single_logo.png", color: Colors.orange,),
              Text("Aden, Yemen",
              style: app_text_style().copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: greyTextColor
              ),),

              // Carousel View items
              SizedBox(
                height: 150,
                child: CarouselView(
                  itemExtent: 400, 
                  children: [
                     myCarouselContainer(
                  "images/banana.jpg"
                ),
                myCarouselContainer(
                  "images/apple.jpg"
                ),
                myCarouselContainer(
                  "images/banana.jpg"
                ),
                  ]),
              ),
             
          
              // Exclusive Offers items
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text("Exclusive Offer",
                    style: app_text_style().copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                    ),),
                    Text("See all",
                    style: app_text_style().copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: primaryColor
                    ),)
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
                      "4.99"
                    ),
                    app_items_card(
                      "images/apple.jpg",
                      "Fresh Apple",
                      "1kg, Pricing",
                      "6.00"
                    ),
                    app_items_card(
                      "images/apple.jpg",
                      "Fresh Apple",
                      "1kg, Pricing",
                      "6.00"
                    ),
                  ],
                ),
              ),
          
              //best selling items
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text("Best Selling",
                    style: app_text_style().copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                    ),),
                    Text("See all",
                    style: app_text_style().copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: primaryColor
                    ),)
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
                      "4.99"
                    ),
                    app_items_card(
                      "images/apple.jpg",
                      "Fresh Apple",
                      "1kg, Pricing",
                      "6.00"
                    ),
                    app_items_card(
                      "images/apple.jpg",
                      "Fresh Apple",
                      "1kg, Pricing",
                      "6.00"
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}