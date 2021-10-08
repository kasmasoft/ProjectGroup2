import 'package:flutter/material.dart';

class NextPrayer extends StatefulWidget {
  const NextPrayer({ Key? key }) : super(key: key);

  @override
  _NextPrayerState createState() => _NextPrayerState();
}

class _NextPrayerState extends State<NextPrayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Fajr",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Colors.white,//Theme.of(context).primaryColor,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}