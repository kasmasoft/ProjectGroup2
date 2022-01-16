import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/helpers/local_notification_services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:audioplayers/audio_cache.dart';

import 'package:prayer_time_application/helpers/prayerTimes.dart';
import 'package:prayer_time_application/providers/notification_model.dart';
import 'package:provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:vibration/vibration.dart';

class NextCounter extends StatefulWidget {
  final nextPrayer;
  const NextCounter(this.nextPrayer);

  @override
  _NextCounterState createState() => _NextCounterState();
}

class _NextCounterState extends State<NextCounter> {
  Duration? duration;
  Timer? timer;
  final player = AudioCache();

  @override
  void initState() {
    super.initState();
    duration = getNextPrayerCounter(widget.nextPrayer);
    startCounter();
  }

  startCounter() {
    Timer.periodic(Duration(seconds: 1), (Timer t) => countDown());
  }

  countDown() async {
    final cd = -1;

    if (mounted) {
      setState(() {
        final seconds = duration!.inSeconds + cd;
        duration = Duration(seconds: seconds);
      });
    }
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration!.inHours);
    final minutes = twoDigits(duration!.inMinutes.remainder(60));
    final seconds = twoDigits(duration!.inSeconds.remainder(60));

    vibrate() async {
      if (await Vibration.hasVibrator()) {
        print('vibration working');
        Vibration.vibrate(pattern: [
          500,
          500,
          500,
          500,
          500,
          500,
          500,
          500,
          500,
          500,
          500,
          500
        ]);
      }
    }

    return Consumer<NotificationModel>(
      builder: (context, obj, child) {
        if (duration!.inSeconds == 1) {
          LocalNotificationService.scheduleNotification(obj.currentPrayer, 'mumbai');
          print(obj.currentPrayer);
          print(obj.getToggleIndex());
          if (obj.getToggleIndex() == 0) {
            print(obj.currentPrayer);
            player.play('audios/azaan.mp3', isNotification: true);
            player.clear('audios/azaan.mp3');
          } else if (obj.getToggleIndex() == 1) {
            print('vibrate');
            vibrate();
          } else if (obj.getToggleIndex() == 2) {
            player.play('audios/beep.mp3', isNotification: true);
            player.clear('audios/beep.mp3');
          }
        }
        return Text(
          hours + ":" + minutes + ":" + seconds,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: color2,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 4),
      child: Column(
        children: [
          Text(
            widget.nextPrayer + ' starts in',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: color2,
            ),
          ),
          buildTime(),
        ],
      ),
    );
  }
}
