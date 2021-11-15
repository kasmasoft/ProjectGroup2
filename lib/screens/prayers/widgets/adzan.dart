// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';
// import 'package:prayer_time_application/helpers/notifications.dart';
import 'package:prayer_time_application/helpers/prayerTimes.dart';
import 'package:prayer_time_application/providers/notification_model.dart';
import 'package:provider/provider.dart';
import 'prayer_container.dart';
import 'icon_text.dart';
import 'date_picker.dart';

class Adzan extends StatefulWidget {
  @override
  State<Adzan> createState() => _AdzanState();
}

class _AdzanState extends State<Adzan> {
  Map<String, String> prayers = getPrayerTimes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [color1, color2])),
      child: Consumer<NotificationModel>(
        builder: (context, obj, child){
          return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            iconText(
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 15,
                ),
                "Mira Road, Thane",
                "India"),
            SizedBox(
              height: 25,
            ),
            DatePicker(),
            SizedBox(
              height: 25,
            ),
            // GestureDetector(
            //     onTap: () {
            //       scheduleNotification();
            //     },
            //     child: Icon(Icons.notification_add, color: Colors.white)),
            SizedBox(
              height: 25,
            ),
            PrayerContainer("Fajr", prayers['fajr'].toString(), obj.currToggleFajr),
            SizedBox(
              height: 15,
            ),
            PrayerContainer("Sunrise", prayers['sunrise'].toString(), obj.currToggleSunrise),
            SizedBox(
              height: 15,
            ),
            PrayerContainer("Dhuhr", prayers['dhuhr'].toString(), obj.currToggleDhuhr),
            SizedBox(
              height: 15,
            ),
            PrayerContainer("Asr", prayers['asr'].toString(), obj.currToggleAsr),
            SizedBox(
              height: 15,
            ),
            PrayerContainer("Maghrib", prayers['maghrib'].toString(), obj.currToggleMaghrib),
            SizedBox(
              height: 15,
            ),
            PrayerContainer("Isha", prayers['isha'].toString(), obj.currToggleIsha),
            SizedBox(
              height: 25,
            ),
          ],
        );
        },
      )
    ));
  }
}
