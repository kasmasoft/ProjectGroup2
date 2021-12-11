import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';

Widget iconText(Icon icon, String title, String subTitle) {
    double h = 30;
    double w = 30;
    Container left = Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
          color: color3, borderRadius: BorderRadius.circular(w / 2)
        ),
      child: icon,
    );

    Column right = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: TextStyle(color: color2)),
        Text(subTitle, style: TextStyle(color: color2, fontSize: 10)),
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