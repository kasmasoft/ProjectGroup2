import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';

//import 'package:home/searchbar.dart';

class Halal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Container(
          child: Image.asset(
            "assets/hal.jpeg",

            //height: 500,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
          decoration: BoxDecoration(
            color: color1,
            borderRadius: BorderRadius.circular(29.5),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(color: color2),
              icon: Icon(
                Icons.search,
                color: color2,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ]),
    ));
  }
}
