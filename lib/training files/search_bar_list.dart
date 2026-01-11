import 'package:flutter/material.dart';



class SearchBarList extends StatefulWidget {
  const SearchBarList({super.key});

  @override
  State<SearchBarList> createState() => _SearchBarListState();
}



class _SearchBarListState extends State<SearchBarList> {

 List<String> searchedList = [];
 final List<String> originalList = [
    'Apple', 'Banana', 'Orange'
  ];
 final TextEditingController _searchedField = TextEditingController();

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchedList = originalList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: _searchedField,
            onChanged: (value) {
              if(value.isEmpty){
                setState(() {
                searchedList = originalList;
                });
              }
              else{
                setState(() {
                searchedList = originalList.where(
                  (index){
                  return index
                  .toLowerCase()
                  .contains(value.toLowerCase());
                  }
                ).toList();
                });
              }
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchedList.length,
              itemBuilder: (context, index){
                return Text(searchedList[index]);
              })
          )
        ],
      ),
    );
  }
}