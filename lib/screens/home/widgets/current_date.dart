import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:prayer_time_application/constants.dart';

class CurrentDate extends StatefulWidget {

  @override
  State<CurrentDate> createState() => _CurrentDateState();
}

class _CurrentDateState extends State<CurrentDate> {
  var _hijridt = HijriCalendar.now();
  String ggdt = DateFormat('EEEE, dd MMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Text(
            _hijridt.toFormat("dd MMMM yyyy "),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: color2,
              letterSpacing: letterspacing,
            ),
          ),
          Text(
            ggdt.toString(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: color2,
            ),
          )
        ],
      ),
    );
  }
}
