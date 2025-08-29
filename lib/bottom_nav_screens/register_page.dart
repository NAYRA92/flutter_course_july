import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_july/bottom_nav_screens/explore_page.dart';
import 'package:flutter_course_july/bottom_nav_screens/login_page.dart';

import '../constant.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _password = TextEditingController();

  String mobile = "";

  bool exist = false;

  Future<bool> checkExist(String docID) async {
    try {
      await FirebaseFirestore.instance.doc("users/$docID").get().then((doc) {
        if (doc.exists) {
          //if document exist

          Map<String, dynamic> data = doc.data()!;
          // You can then retrieve the value from the Map like this:
          mobile = data['mobile'];
          exist = true;

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("User Already Registered!"),
            backgroundColor: Colors.red[300],
          ));
        }

        //if document not exists
        else if (!doc.exists) {
          exist = false;
          setState(() async {
            await FirebaseFirestore.instance
                .collection('users')
                .doc(_mobile.text)
                .set({
              'name': _username.text,
              'password': _password.text,
              'mobile': _mobile.text,
            });

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("User Success Registered!"),
              backgroundColor: Colors.green[300],
            ));
            Navigator.pop(context);
          });
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
      return exist;
    } catch (e) {
      // If any error
      print(e);
      return false;
    }
  }

  bool secure_code = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/single_logo.png",
                color: Colors.orange,
              ),
              Text(
                "REGISTERATION",
                style: app_text_style()
                    .copyWith(fontSize: 34, color: Colors.black),
              ),

              //username field
              TextFormField(
                controller: _username,
                decoration: InputDecoration(
                    hintText: "Enter your first and last name",
                    labelText: "Username",
                    prefixIcon: Icon(
                      Icons.person,
                      color: primaryColor,
                    )),
              ),

              //mobile field
              TextFormField(
                controller: _mobile,
                decoration: InputDecoration(
                    hintText: "Enter your mobile number",
                    labelText: "Mobile",
                    prefix: Text("+967"),
                    prefixIcon: Icon(
                      Icons.phone_android,
                      color: primaryColor,
                    )),
              ),

              //password field
              TextFormField(
                controller: _password,
                obscureText: secure_code,
                decoration: InputDecoration(
                    hintText: "Enter your password",
                    labelText: "Password",
                    prefixIcon: Icon(
                      Icons.lock,
                      color: primaryColor,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            secure_code = !secure_code;
                          });
                        },
                        icon: Icon(secure_code
                            ? Icons.visibility_off
                            : Icons.visibility))),
              ),

              SizedBox(
                height: 20,
              ),

              //login button
              SizedBox(
                height: 50,
                child: app_ele_button("Register", () async {
                  checkExist(_mobile.text);
                }),
              ),

              //register account
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    "Already Have Account? Login.",
                    style: TextStyle(
                      color: greyTextColor,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
