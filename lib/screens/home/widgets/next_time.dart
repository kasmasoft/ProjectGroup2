import 'package:flutter/material.dart';

class NextTime extends StatefulWidget {
  const NextTime({Key? key}) : super(key: key);

  @override
  _NextTimeState createState() => _NextTimeState();
}

class _NextTimeState extends State<NextTime> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10.0,),
        Text(
          "05:30",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,//Theme.of(context).primaryColor,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Text(
          "AM",
          style: TextStyle(
            color: Colors.white,//Theme.of(context).primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}
