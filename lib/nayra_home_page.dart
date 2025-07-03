// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_course_july/profile_page.dart';

//stateful
class NayraHomePage extends StatefulWidget {
  const NayraHomePage({super.key});

  @override
  State<NayraHomePage> createState() => _NayraHomePageState();
}

class _NayraHomePageState extends State<NayraHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //#895f1a
          backgroundColor: const Color(0xff895f1a),
          title: Text(
            "Nayra Home Page",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.7,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                icon: Icon(
                  Icons.person_3_rounded,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
          // elevation: 10.0,
          // shadowColor: Colors.black,
        ),
        body: Center(
            child: Column(
          children: [
            SizedBox(
              height: 400,
              child:
                  CarouselView(itemExtent: 400, shrinkExtent: 200, children: [
                myCarouselContainer(
                  Colors.amber[200],
                  "https://images.ctfassets.net/23aumh6u8s0i/4TsG2mTRrLFhlQ9G1m19sC/4c9f98d56165a0bdd71cbe7b9c2e2484/flutter"
                ),
                 myCarouselContainer(
                  Colors.amber[300],
                  "https://images.unsplash.com/photo-1742933779258-066ced2b3c2f?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                ),
                 myCarouselContainer(
                  Colors.amber[400],
                  "https://images.unsplash.com/photo-1744439916846-2e8b0113d2db?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                ),
                 myCarouselContainer(
                  Colors.amber[500],
                  "https://images.unsplash.com/photo-1750544684965-873a86eba4b6?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                ),
              ]),
            )
          ],
        )));
  }

  Container myCarouselContainer(
    Color? clr,
    String image_url
  ) {
    return Container(
                decoration: BoxDecoration(
                    color: clr,
                    image: DecorationImage(
                        image: NetworkImage(image_url),
                        fit: BoxFit.cover)),
              );
  }
}

//stateless
class NayraHomePage2 extends StatelessWidget {
  const NayraHomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
