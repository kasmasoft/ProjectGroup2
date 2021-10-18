import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/helpers/prayerTimes.dart';
import 'package:prayer_time_application/screens/home/widgets/counter.dart';
import 'package:prayer_time_application/screens/home/widgets/current_date.dart';
import 'package:prayer_time_application/screens/home/widgets/next_prayer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _nextPrayer;
  late final Map<String, String> _prayers;

  @override
  void initState() {
    _prayers = getPrayerTimes();
    _nextPrayer = getNextPrayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2.5,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [color2, color1],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 100),
          child: Column(
            children: [
              NextPrayer(_nextPrayer),
              Container(
                padding: EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CurrentDate(),
                    NextCounter(_nextPrayer),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
