import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

// ignore: must_be_immutable
class HijriD extends StatelessWidget {
  var _format = HijriCalendar.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          _format.toFormat("dd MMMM yyyy "),
          style: TextStyle(
            fontSize: 18,
            color: Colors.black45,
          ),
        ),
      ),
    );
  }
}
