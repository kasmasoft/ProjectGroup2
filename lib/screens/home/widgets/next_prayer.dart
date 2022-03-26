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
            widget.nextPrayer.toString() == 'none'? "Fajr(tomorrow)":widget.nextPrayer.toString().capitalize(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color2,
              letterSpacing: letterspacing,
            ),
          ),
          Text(
            widget.nextPrayer.toString() == 'none'? "Not available":_prayers[widget.nextPrayer].toString(),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: color2
              ),
          ),
        ],
      ),
    );
  }
}
