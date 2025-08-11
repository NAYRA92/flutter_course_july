import 'package:flutter/material.dart';

import '../constant.dart';
import '../order_accepted_screen.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
        title: Text("My Cart"),
        centerTitle: true,
      ),

      //our cart body
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
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
                                cartItemsTitle[index], "7pcs, Pricing", "4.99", (){}),
                          ),
                          IconButton(
                              onPressed: () {
                                //deletion code
                              },
                              icon: Icon(
                                Icons.delete_forever,
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
                    ),
            
                  
                  ],
                );
                // Text("Item $index in Cart");
                
              },
            ),
          ),

          //checkout button
            app_ele_button("Checkout", (){
                  showModalBottomSheet(context: context, 
                    builder: (BuildContext context){
                      return StatefulBuilder(
                        builder: (context, setState) {
                          return Container(
                            // height: 250,
                            width: double.infinity,
                            margin: EdgeInsets.all(10),
                            child: Center(
                              child: Column(
                                children: [
                                 //checkout and exit
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  Text("Checkout", style: 
                                  app_text_style().copyWith(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  IconButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, icon: Icon(Icons.close))
                                 ],),
                                 //---
                                 Divider(
                                  color: greyColor,
                                 ),
                                 bottomSheetItems("Delivery", "Select Method", (){}),
                                  Divider(
                                  color: greyColor,
                                 ),
                                 bottomSheetItems("Payment", "Select Card", (){}),
                                  Divider(
                                  color: greyColor,
                                 ),
                                 bottomSheetItems("Promo Code", "Pick Discount",(){}),
                                  Divider(
                                  color: greyColor,
                                 ),
                                 bottomSheetItems("Total Cost", "\$13.97", (){}),
                                  Divider(
                                  color: greyColor,
                                 ),
                                 Text("By placing an order you agree to our Terms And Conditions",
                                 style: app_text_style().copyWith(
                                  color: greyTextColor,
                                  fontSize: 14
                                 ),),

                                 //place order button
                                 SizedBox(
                                  height: 30,
                                 ),
                                 app_ele_button("Place Order", (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderAcceptedScreen()));
                                 })
                                ],
                              )),
                          );
                        }
                      );
                    });
              }),

          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

}

//example of a simple for loop
// int items = 10; // Example number of items
// for(int i=0; i<= items; i++){
//   print("Item $i");
// }