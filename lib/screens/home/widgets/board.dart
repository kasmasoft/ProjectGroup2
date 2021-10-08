import 'package:flutter/material.dart';
import 'package:prayer_time_application/widgets/getlocation.dart';
import 'next_time.dart';
import 'next_prayer.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NextPrayer(),
          SizedBox(
            height: 30.0,
          ),
          NextTime(),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: Colors.white//Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 5.0,
              ),
              // LocationScreen(),
              Text(
                "Mumbai",
                style: TextStyle(
                    color: Colors.white,//Theme.of(context).primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ],
      ),
    );
  }
}
