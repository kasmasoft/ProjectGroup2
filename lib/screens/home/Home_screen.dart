import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/helpers/prayerTimes.dart';
import 'package:prayer_time_application/screens/fast_tracker/fast_tracker.dart';
import 'package:prayer_time_application/screens/halal_food/halal_food.dart';
import 'package:prayer_time_application/screens/home/widgets/counter.dart';
import 'package:prayer_time_application/screens/home/widgets/current_date.dart';
import 'package:prayer_time_application/screens/home/widgets/my_location.dart';
import 'package:prayer_time_application/screens/home/widgets/next_prayer.dart';
import 'package:prayer_time_application/screens/home/widgets/setting_button.dart';
import 'package:prayer_time_application/screens/mosque_search/mosque_search.dart';
import 'package:prayer_time_application/screens/prayer_tracker/tracker.dart';
import 'package:prayer_time_application/screens/prayers/prayers.dart';
import 'package:prayer_time_application/screens/qibla_compass/qiblah_screen.dart';
import 'widgets/custom_icon.dart';
//import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _nextPrayer;

  @override
  void initState() {
    _nextPrayer = getNextPrayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
              child: (Stack(children: <Widget>[
            Container(
              child: Image.asset(
                "assets/images/lights.jpeg",
                width: screenWidth,
                //height: 500,
              ),
            ),
            Container(
                padding: EdgeInsets.only(
                  top: 20,
                ),
                child: Column(children: [
                  SettingButton(),
                  Padding(
                      padding: EdgeInsets.only(top: 90),
                      child: NextPrayer(_nextPrayer)),
                  LocationScreen(),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CurrentDate(),
                        NextCounter(_nextPrayer),
                      ],
                    ),
                  ),
                ]))
          ]))),
          Expanded(
            child: Container(
              color: color3,
              //child: Padding(
              // padding: EdgeInsets.fromLTRB(0, 0, 1, 0),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, MosqueScreen.routeName);
                      },
                      child: CustomeIcon(Icons.search, 'Mosque Search')),
                  GestureDetector(
                    onTap : (){
                      Navigator.pushNamed(context, HalalFoodSearch.routeName);
                    },
                    child: CustomeIcon(Icons.food_bank, 'Halal Food Search')),
                  GestureDetector(
                      onTap: () => {
                            Navigator.pushNamed(context, Prayers.routeName),
                          },
                      child: CustomeIcon(Icons.watch, 'Prayer Times')),
                  GestureDetector(
                    onTap: () => {
                      Navigator.pushNamed(context, PrayerTracker.routeName),
                    },
                    child: CustomeIcon(Icons.list_alt_rounded, 'Prayer Tracker')),
                  GestureDetector(
                    onTap: () => {
                      Navigator.pushNamed(context, FastTracker.routeName),
                    },
                    child: CustomeIcon(Icons.calendar_today_sharp, 'Fast Tracker')),
                  GestureDetector(
                    onTap: () => {
                      Navigator.pushNamed(context, QiblahCompassScreen.routeName),
                    },
                    child: CustomeIcon(Icons.compass_calibration_sharp, 'Qibla Compass')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
