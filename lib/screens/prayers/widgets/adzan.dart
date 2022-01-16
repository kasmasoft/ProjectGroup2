// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/helpers/app_preference.dart';
import 'package:prayer_time_application/helpers/extensions.dart';
// import 'package:prayer_time_application/helpers/notifications.dart';
import 'package:prayer_time_application/helpers/prayerTimes.dart';
import 'package:prayer_time_application/helpers/prayer_times.dart';
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

  final prayerTimeHandler = new PrayerTimeHandler();

  _refreshCalculationMethod() {
    AppPreference.getCalculationMethod().then((value) {
      if (value != null) {
        setState(() {
          prayerTimeHandler.changeMethod(value, () {
            setState(() {});
          });
        });
      }
    });
  }

  @override
  void initState() {
    _refreshCalculationMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [color1, color2])),
            child: Consumer<NotificationModel>(
              builder: (context, obj, child) {
                _buildPrayerList() {
                  if (prayerTimeHandler.prayerTimes != null) {
                    print(prayerTimeHandler.prayerTimes!.currentPrayer());
                    return Column(
                      children: [
                        Text(
                          prayerTimeHandler
                              .prayerTimes!.calculationParameters.method
                              .methodName(),
                          textAlign: TextAlign.right,
                          style: TextStyle(color: color2),
                          // style: AppTextStyle.prayerTile,
                        ),
                        SizedBox(height: 8),
                        PrayerContainer(
                            "fajr",
                            DateFormat.jm()
                                .format(prayerTimeHandler.prayerTimes!.fajr),
                            obj.currToggleFajr),
                        SizedBox(
                          height: 15,
                        ),
                        PrayerContainer(
                            "sunrise",
                            DateFormat.jm()
                                .format(prayerTimeHandler.prayerTimes!.sunrise),
                            obj.currToggleSunrise),
                        SizedBox(
                          height: 15,
                        ),
                        PrayerContainer(
                            "dhuhr",
                            DateFormat.jm()
                                .format(prayerTimeHandler.prayerTimes!.dhuhr),
                            obj.currToggleDhuhr),
                        SizedBox(
                          height: 15,
                        ),
                        PrayerContainer(
                            "asr",
                            DateFormat.jm()
                                .format(prayerTimeHandler.prayerTimes!.asr),
                            obj.currToggleAsr),
                        SizedBox(
                          height: 15,
                        ),
                        PrayerContainer(
                            "maghrib",
                            DateFormat.jm()
                                .format(prayerTimeHandler.prayerTimes!.maghrib),
                            obj.currToggleMaghrib),
                        SizedBox(
                          height: 15,
                        ),
                        PrayerContainer(
                            "Isha",
                            DateFormat.jm()
                                .format(prayerTimeHandler.prayerTimes!.isha),
                            obj.currToggleIsha),
                      ],
                    );
                  }
                  if (prayerTimeHandler.locationError != null) {
                    return Text(prayerTimeHandler.locationError as String);
                  }
                  return SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Center(child: Text(waiting)));
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    iconText(
                        Icon(
                          Icons.location_on,
                          color: color2,
                          size: 15,
                        ),
                        prayerTimeHandler.address,
                        ""),
                    SizedBox(
                      height: 25,
                    ),
                    DatePicker(),
                    SizedBox(
                      height: 25,
                    ),
                    _buildPrayerList(),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                );
              },
            )));
  }
}
