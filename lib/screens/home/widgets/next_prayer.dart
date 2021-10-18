import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/helpers/prayerTimes.dart';
import 'package:prayer_time_application/helpers/string_extension.dart';

class NextPrayer extends StatefulWidget {
  final nextPrayer;
  const NextPrayer(this.nextPrayer);

  @override
  _NextPrayerState createState() => _NextPrayerState();
}

class _NextPrayerState extends State<NextPrayer> {
  late final Map<String, String> _prayers;

  @override
  void initState() {
    _prayers = getPrayerTimes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            widget.nextPrayer.toString().capitalize(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Theme.of(context).primaryColor,
              letterSpacing: letterspacing,
            ),
          ),
          Text(
            _prayers[widget.nextPrayer].toString(),
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}
