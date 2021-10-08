import 'package:flutter/material.dart';
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
      body: Adzan(),  
    );
  }
}

/* Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Builder(
              builder: (BuildContext context) {
                if (prayerTimes != null) {
                  return Column(
                    children: [
                      Text(
                        'Prayer Times for Today',
                        textAlign: TextAlign.center,
                      ),
                      Text('Fajr Time: ' +
                          DateFormat.jm().format(prayerTimes.fajr)),
                      Text('Sunrise Time: ' +
                          DateFormat.jm().format(prayerTimes.sunrise)),
                      Text('Dhuhr Time: ' +
                          DateFormat.jm().format(prayerTimes.dhuhr)),
                      Text('Asr Time: ' +
                          DateFormat.jm().format(prayerTimes.asr)),
                      Text('Maghrib Time: ' +
                          DateFormat.jm().format(prayerTimes.maghrib)),
                      Text('Isha Time: ' +
                          DateFormat.jm().format(prayerTimes.isha)),
                    ],
                  );
                }
                return Text('Waiting for Your Location...');
              },
            )
          ],
        ),
      )*/