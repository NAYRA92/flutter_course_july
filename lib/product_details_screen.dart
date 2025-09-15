import 'package:flutter/material.dart';
import 'package:flutter_course_july/constant.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String image_url;
  final String item_name;
  final String item_unit;
  final double item_price;
  const ProductDetailsScreen(
      {super.key,
      required this.image_url,
      required this.item_name,
      required this.item_unit,
      required this.item_price});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
int cartCount = 1;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(LucideIcons.share))],
      ),

      //main content
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //product images container
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
                    image: NetworkImage(widget.image_url),
                    opacity: 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.image_url,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              ///

              SizedBox(
                height: 20,
              ),

              //product title and details row
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item_name,
                          style: app_text_style().copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        Text(
                          "${widget.item_unit}, ${widget.item_price} \$",
                          style: app_text_style().copyWith(
                              color: greyTextColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        )
                      ],
                    ),

                    //fav heart icon
                    IconButton(onPressed: () {}, icon: Icon(LucideIcons.heart))
                  ],
                ),
              ),

              ///

              //add or remove item count plus price
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //add or remove item count
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              if (cartCount > 1) {
                                setState(() {
                                  cartCount--;
                                });
                              }
                            },
                            child: Text(
                              "-",
                              style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: greyTextColor),
                            )),
                        Center(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, left: 25, right: 25),
                            decoration: BoxDecoration(
                                border: Border.all(color: greyTextColor),
                                borderRadius: BorderRadius.circular(17)),
                            child: Text(
                              "$cartCount",
                              style: app_text_style()
                                  .copyWith(color: Colors.black, fontSize: 18),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              if (cartCount < 10) {
                                setState(() {
                                  cartCount++;
                                });
                              }
                            },
                            child: Text(
                              "+",
                              style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor),
                            )),
                      ],
                    ),

                    ///

                    //price multiplied item count
                    Text(
                     "\$${widget.item_price * cartCount}",
                      style: app_text_style().copyWith(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),

              ///

              Divider(
                indent: 15,
                endIndent: 15,
              ),

              //product details
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Product Detail",
                  style: app_boldText_style().copyWith(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Product Detail ...",
                  style: app_boldText_style()
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),

              ///

              Divider(
                indent: 15,
                endIndent: 15,
              ),

              //nutritions
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nutritions",
                      style: app_boldText_style().copyWith(
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "100g",
                          style: TextStyle(backgroundColor: greyColor),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios))
                      ],
                    )
                  ],
                ),
              ),

              ///

              Divider(
                indent: 15,
                endIndent: 15,
              ),

              //Review stars
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Review",
                      style: app_boldText_style().copyWith(
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.grey),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios))
                      ],
                    )
                  ],
                ),
              ),

              ///

              SizedBox(
                height: 20,
              ),
              Center(
                child: app_ele_button("Add to Basket", () {
                  Navigator.pop(context);
                }),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
