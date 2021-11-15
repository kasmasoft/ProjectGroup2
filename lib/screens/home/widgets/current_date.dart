import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/providers/main_model.dart';
import 'package:provider/provider.dart';

class CurrentDate extends StatefulWidget {
  @override
  State<CurrentDate> createState() => _CurrentDateState();
}

class _CurrentDateState extends State<CurrentDate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Consumer<MainModel>(
        builder: (context, obj, child) {
          return Column(
            children: [
              Text(
                obj.curhijridate.toFormat("dd MMMM yyyy "),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: color2,
                  letterSpacing: letterspacing,
                ),
              ),
              Text(
                obj.curggdate.toString(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: color2,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
