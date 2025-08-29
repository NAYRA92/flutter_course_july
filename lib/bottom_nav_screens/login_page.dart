import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_july/bottom_nav_screens/explore_page.dart';
import 'package:flutter_course_july/bottom_nav_screens/register_page.dart';
import 'package:flutter_course_july/constant.dart';
import 'package:flutter_course_july/home_screen.dart';


String userName = "";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _mobile = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool secure_code = true;

  String mobile = "";
  String password = "";

  bool exist = false;

  Future<bool> checkExist(String docID) async {
    try {
      await FirebaseFirestore.instance.doc("users/$docID").get().then((doc) {
        if (doc.exists) {
          //if document exist, check user password
          //here I made the document ID as user mobile number

          Map<String, dynamic> data = doc.data()!;
          // You can then retrieve the value from the Map like this:
          userName = data['name'];
          mobile = data['mobile'];
          password = data['password'];

          if (password == _password.text && mobile == _mobile.text) {
            //
            exist = true;
            //if entered password is correct, go to next screen
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(
                    user_name: userName,
                  ),
                ));
          }

          //if entered value is not equal to document password
          else if (password != _password.text || mobile != _mobile.text) {
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Worng mobile or password!"),
              backgroundColor: Colors.red[300],
            ));
          }
        }

        //if document not exists
        else if (!doc.exists) {
          exist = false;
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("User Not Found!"),
              backgroundColor: Colors.orange[300],
            ));
          });
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
      return exist;
    } catch (e) {
      // If any error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Some went Wrong! Try Again."),
              backgroundColor: Colors.blue[300],
            ));
      return false;
    }
  }

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
                "LOGIN",
                style: app_text_style()
                    .copyWith(fontSize: 34, color: Colors.black),
              ),

              //mobile field
              TextFormField(
                controller: _mobile,
                decoration: InputDecoration(
                  hintText: "Enter your mobile number",
                  labelText: "Mobile",
                  prefix: Text("+967"),
                ),
              ),

              //password field
              TextFormField(
                controller: _password,
                obscureText: secure_code,
                decoration: InputDecoration(
                    hintText: "Enter your password",
                    labelText: "Password",
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
                child: app_ele_button("Login", () {
                  checkExist(_mobile.text);
                }),
              ),

              //register account
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: Text(
                    "Don't Have Account? Register.",
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
