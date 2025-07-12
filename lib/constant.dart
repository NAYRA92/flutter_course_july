import 'package:flutter/material.dart';


Color primaryColor = const Color(0xff53B175);

Widget app_ele_button(
  String text,
  Function() fun
){
  return Container(
    width: 353,
    height: 67,
    child: ElevatedButton(
      onPressed: fun,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: Text(
        text,
        style: app_text_style()
      ),
    ),
  );
}

TextStyle app_text_style(){
  return TextStyle(
    color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      fontFamily: "Gilroy"
  );
}