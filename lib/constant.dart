import 'package:flutter/material.dart';

Color primaryColor = const Color(0xff53B175);
Color greyColor = const Color(0xffE2E2E2);
Color greyTextColor = const Color(0xff7C7C7C);

Widget app_ele_button(String text, Function() fun) {
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
      child: Text(text, style: app_text_style()),
    ),
  );
}

TextStyle app_text_style() {
  return TextStyle(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      fontFamily: "Gilroy");
}

Widget app_items_card(
    String image_url, String item_name, String item_count, String item_price) {
  return Container(
    width: 180,
    padding: const EdgeInsets.all(5),
    margin: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: greyColor,
        width: 1,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.center,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: AssetImage(image_url), fit: BoxFit.cover)),
            )),
        SizedBox(
          height: 20,
        ),
        Text(item_name,
            style: app_text_style().copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        Text(item_count,
            style: app_text_style().copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: greyTextColor,
            )),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$$item_price",
                  style: app_text_style().copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ))
            ],
          ),
        )
      ],
    ),
  );
}

// Carousel home page view
Container myCarouselContainer(String image_url) {
  return Container(
    height: 115,
    decoration: BoxDecoration(
        color: greyColor,
        image:
            DecorationImage(image: AssetImage(image_url), fit: BoxFit.cover)),
  );
}
