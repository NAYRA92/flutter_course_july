import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_course_july/ai_chat_page.dart';
import 'package:http/http.dart' as http;

import 'constant.dart';
import 'product_details_screen.dart';

class HomeScreenMysql extends StatefulWidget {
  final String user_name;
  const HomeScreenMysql({super.key, required this.user_name});

  @override
  State<HomeScreenMysql> createState() => _HomeScreenMysqlState();
}

class _HomeScreenMysqlState extends State<HomeScreenMysql> {
  List<dynamic> data = [];

  String apiUrl = "https://lamasathadhramia.starcodedev.com/flutter_course_mysql.php";

  Future<void> _fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));
    try {
      if (response.statusCode == 200) {
        final get_data = jsonDecode(response.body);
        for (var index in get_data) {
          data.add(index);
        }
        setState(() {});
        // print(data[0]['name']);
        print("Data fetched successfully");
      } else {
        print("Failed to fetch data ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context, 
            builder: (context) => AlertDialog(
              title: Text("Hello, ${widget.user_name}"),
              content: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AiChatPage()
                ),
              actions: [
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                  child: Text("Close"))
              ],
            ));
        },
        child: Icon(
          Icons.message,
          color: Colors.orange,
        ),
        tooltip: "AI Assistant",
      ),

        body: Center(
          child: SingleChildScrollView(
            child: Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 25, bottom: 8, left: 5, right: 5),
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

                //products list view
                SizedBox(
                  height: 280,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final productData = data[index];
                  return 
                  app_items_card(
                            productData['image'], 
                             productData['name'], 
                              productData['unit'], 
                             productData['price'], 
                              (){
                                Navigator.push(context, 
                                MaterialPageRoute(builder: (context) => ProductDetailsScreen(
                                  image_url: productData['image'],
                                  item_name: productData['name'],
                                  item_unit: productData['unit'],
                                  item_price: double.parse(productData['price']) ,
                                     )));
                              }
                              );
                  
                  // ListTile(
                  //   title:
                  //       Text('${data[index]['id']}. Product Name: ${data[index]['name']}'),
                  //   subtitle: Text("Price: ${data[index]['price']}"),
                  // );
                        },
                      ),
                ),
              ],
            ),
          ),
        ));
  }
}
