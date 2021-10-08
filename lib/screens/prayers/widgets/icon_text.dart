import 'package:flutter/material.dart';

Widget iconText(Icon icon, String title, String subTitle) {
    double h = 30;
    double w = 30;
    Container left = Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
          color: Color(0xFF8133d4), borderRadius: BorderRadius.circular(w / 2)
        ),
      child: icon,
    );

    Column right = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: TextStyle(color: Colors.white)),
        Text(subTitle, style: TextStyle(color: Colors.white, fontSize: 10)),
      ],
    );

    return Row(
      children: <Widget>[
        left,
        SizedBox(
          width: 10,
        ),
        right
      ],
    );
  }