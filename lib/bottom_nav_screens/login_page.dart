import 'package:flutter/material.dart';
import 'package:flutter_course_july/bottom_nav_screens/register_page.dart';
import 'package:flutter_course_july/constant.dart';
import 'package:flutter_course_july/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _mobile = TextEditingController();
  TextEditingController _password = TextEditingController();

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
              Text("LOGIN",
              style: app_text_style().copyWith(
                fontSize: 34,
                color: Colors.black
              ),),

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
                  // print(_password.text);
                  if (_mobile.text == "779055730" && _password.text == "123") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Wrong Mobile or Password!"),
                          backgroundColor: Colors.red[300],));
                    // print("Wrong Mobile or Password!");
                  }
                }),
              ),

              //register account
              TextButton(onPressed: (){
                 Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegisterPage()));
              }, child: Text("Don't Have Account? Register.",
              style: TextStyle(
                color: greyTextColor,
              ),))
            ],
          ),
        ),
      ),
    );
  }
}
