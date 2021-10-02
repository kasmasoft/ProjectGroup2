import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';

class Prayers extends StatefulWidget {
  const Prayers({Key? key}) : super(key: key);
  static String routeName = "/prayers";

  @override
  _PrayersState createState() => _PrayersState();
}

class _PrayersState extends State<Prayers> {
  late PrayerTimes prayerTimes;

  @override
  void initState() {
    prayerTimes = PrayerTimes(
              Coordinates(19.29209743677179, 72.85928629201034),
              DateComponents.from(DateTime.now()),
              CalculationMethod.karachi.getParameters());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Prayers"),
      ),
      body: Center(
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
      ));
  }
}
