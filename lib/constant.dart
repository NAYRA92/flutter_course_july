import 'package:flutter/material.dart';

Color primaryColor = const Color(0xff53B175);
Color greyColor = const Color(0xffE2E2E2);
Color greyTextColor = const Color(0xff7C7C7C);
Color amberColor = const Color.fromARGB(255, 255, 237, 178);

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

//white font
TextStyle app_text_style() {
  return TextStyle(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,);
}

//black bold font
TextStyle app_boldText_style() {
  return TextStyle(
      fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold);
}

//item card for the app

Widget app_items_card(String image_url, String item_name, String item_count,
    String item_price, Function() fun) {
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
                      image: NetworkImage(image_url), fit: BoxFit.cover)),
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
                  onPressed: fun,
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

Row userProfileItems(IconData icn, String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Icon(icn),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: app_text_style().copyWith(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
      IconButton(
          onPressed: () {
            // Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ))
    ],
  );
}

Row bottomSheetItems(String title, String subtitle, Function() fun) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: app_text_style().copyWith(color: greyTextColor, fontSize: 18),
      ),
      IconButton(
          onPressed: fun,
          icon: Row(
            children: [
              Text(
                subtitle,
                style: app_text_style()
                    .copyWith(color: Colors.black, fontSize: 16),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
              )
            ],
          ))
    ],
  );
}
