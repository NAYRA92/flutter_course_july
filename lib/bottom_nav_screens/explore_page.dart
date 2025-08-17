import 'package:flutter/material.dart';
import 'package:flutter_course_july/constant.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Products", style: app_boldText_style().copyWith(
          fontSize: 18
        ),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.send)),
                  hintText: "Search for products",
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: InputBorder.none
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.8
                ),
                children: [
                  gridview_items("basket", "Fresh Fruits & Vegetable", 0xfff8a44c),
                  gridview_items("basket", "Meat & Fish", 0xff53b175),
                  gridview_items("basket", "Cooking Oil & Ghee", 0xff125be),
                  gridview_items("basket", "Bakery & Snackes", 0xff53b175),
                ],
              ),
            ))
        ],
      ),
    );
  }

  Container gridview_items(
    String imageUrl,
    String title,
    int color_code
  ) {
    return Container(
                  height: 180,
                  width: 170,
                  decoration: BoxDecoration(
                    color: Color(color_code).withOpacity(0.10),
                    border: Border.all(
                      color: Color(color_code).withOpacity(0.7),
                      width: 1
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("images/$imageUrl.png", height: 150,),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title, 

                          textAlign: TextAlign.center,
                          
                          style: app_boldText_style().copyWith(
                                fontSize: 18
                              ),),
                      )
                    ],
                  ),
                );
  }
}