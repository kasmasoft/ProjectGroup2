import 'package:flutter/material.dart';

class Prayers extends StatefulWidget {
  const Prayers({ Key? key }) : super(key: key);

  @override
  _PrayersState createState() => _PrayersState();
}

class _PrayersState extends State<Prayers> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Prayers Screen"),
    );
  }
}