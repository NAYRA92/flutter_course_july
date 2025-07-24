import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            child: ListView())
        ],
      ),
    );
  }
}