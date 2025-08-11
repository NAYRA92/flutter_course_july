import 'package:flutter/material.dart';
import 'package:flutter_course_july/constant.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            userProfileSection(),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: greyColor,
            ),
            userProfileItems(LucideIcons.listOrdered, "Orders"),
             Divider(
              color: greyColor,
            ),
            userProfileItems(LucideIcons.idCard, "My Details"),
             Divider(
              color: greyColor,
            ),
            userProfileItems(Icons.pin_drop_outlined, "Delivery Address"),
             Divider(
              color: greyColor,
            ),
            userProfileItems(LucideIcons.walletCards, "Payment Methods"),
             Divider(
              color: greyColor,
            ),
            userProfileItems(Icons.local_offer_outlined, "Promo Card"),
             Divider(
              color: greyColor,
            ),
            userProfileItems(LucideIcons.listOrdered, "Orders"),
             Divider(
              color: greyColor,
            ),
            userProfileItems(LucideIcons.listOrdered, "Orders"),
             Divider(
              color: greyColor,
            ),
            userProfileItems(LucideIcons.listOrdered, "Orders")
          ],
        ),
      ),
    );
  }
}

class userProfileSection extends StatelessWidget {
  const userProfileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("images/profile.jpg"),
          radius: 32,
        ),
        SizedBox( width: 15,),
        
        //persone details
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //name and edit button
            Row(
              children: [
                Text("Nayra Hashem", style: app_text_style().copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),),
                IconButton(onPressed: (){}, icon: Icon(Icons.edit, 
                size: 18,
                color: primaryColor,))
              ],
            ),
    
            //email
            Text("naira.hashem@gmail.com", style: app_text_style().copyWith(
              color: greyTextColor,
              fontWeight: FontWeight.w400,
              fontSize: 18
            ),),
          ],
        ),
      ],
    );
  }
}