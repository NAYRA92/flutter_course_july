import 'package:flutter/material.dart';
import 'package:flutter_course_july/constant.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(LucideIcons.share))
        ],),

        //main content
        body: Center(
          child: Column(
            children: [
              Container(
                height: 370,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  image: DecorationImage(
                    image: AssetImage("images/apple.jpg"),
                    opacity: 0.2,
                     fit: BoxFit.cover,),
                ),

                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("images/apple.jpg",
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Natural Red Apple",
                        style: app_text_style().copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                        ),),
                        Text("1kg, Price",
                        style: app_text_style().copyWith(
                          color: greyTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16
                        ),)
                      ],
                    ),
                
                    //fav heart icon
                    IconButton(onPressed: (){}, icon: Icon(LucideIcons.heart))
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}