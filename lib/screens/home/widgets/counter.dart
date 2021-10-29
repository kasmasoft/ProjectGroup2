import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/helpers/local_notification_services.dart';

import 'package:prayer_time_application/helpers/prayerTimes.dart';

class NextCounter extends StatefulWidget {
  final nextPrayer;
  const NextCounter(this.nextPrayer);

  @override
  _NextCounterState createState() => _NextCounterState();
}

class _NextCounterState extends State<NextCounter> {
  Duration? duration;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    duration = getNextPrayerCounter(widget.nextPrayer);
    startCounter();
  }

  startCounter() {
    Timer.periodic(Duration(seconds: 1), (Timer t) => countDown());
  }

  countDown() {
    final cd = -1;

    if (mounted) {
      setState(() {
        final seconds = duration!.inSeconds + cd;
        duration = Duration(seconds: seconds);
      });
    }

    if (duration!.inSeconds == 1) {
      LocalNotificationService.scheduleNotification('dhuhr', 'mumbai');
    }
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration!.inHours);
    final minutes = twoDigits(duration!.inMinutes.remainder(60));
    final seconds = twoDigits(duration!.inSeconds.remainder(60));

    return Text(
      hours + ":" + minutes + ":" + seconds,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: color2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Text(
            widget.nextPrayer + ' starts in',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: color2,
              letterSpacing: letterspacing,
            ),
          ),
          buildTime(),
        ],
      ),
    );
  }
}