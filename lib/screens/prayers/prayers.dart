import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/screens/prayers/widgets/adzan.dart';

class Prayers extends StatefulWidget {
  const Prayers({Key? key}) : super(key: key);
  static String routeName = "/prayers";

  @override
  _PrayersState createState() => _PrayersState();
}

class _PrayersState extends State<Prayers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: color2, //change your color here
          ),
          backgroundColor: color1,
          centerTitle: true,
          title: Text(
            "Prayers Times",
            style: TextStyle(color: color2),
          ),
        ),
      body: Adzan(),  
    );
  }
}