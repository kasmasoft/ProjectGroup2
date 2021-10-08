import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:prayer_time_application/helpers/prayerTimes.dart';
import 'package:prayer_time_application/screens/home/widgets/board.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _format = HijriCalendar.now();
  String ggdt = DateFormat('EEEE, dd MMM').format(DateTime.now());

  @override
  void initState() {
    getPrayerTimes();
    super.initState();
  }

  void getCurrentPrayer() {
    Map<String, String> curPrayers = prayers;
    print(curPrayers);
  }

  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container(
        //   decoration: BoxDecoration(
        //     color: Color(0xFF492191)
        //   ),
        // ),
        Container(
          decoration: BoxDecoration(
            color: Color(0x2adfbbfb),
            image: DecorationImage(
              image: AssetImage('assets/images/bg2.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Theme.of(context).primaryColor.withOpacity(0.3), BlendMode.dstATop),
            ),
          ),
        ),
        SafeArea(
          child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  ggdt,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _format.toFormat("dd MMMM yyyy "),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black45,
                  ),
                ),
                // )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xaadfbbfb),
                      image: DecorationImage(
                        image: AssetImage('assets/images/mosquebg.png'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Color(0xFFdfbbfb).withOpacity(0.4), BlendMode.dstATop),
                      ),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(
                      child: Board(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        )),
      ],
    );
  }
}
