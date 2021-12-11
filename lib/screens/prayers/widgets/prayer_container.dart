import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/providers/notification_model.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrayerContainer extends StatefulWidget {
  final String name;
  final String time;
  final int toggleIndex;

  PrayerContainer(this.name, this.time, this.toggleIndex);

  @override
  _PrayerContainerState createState() => _PrayerContainerState();
}

class _PrayerContainerState extends State<PrayerContainer> {
  int currentToggleIndex = 0;

  List<Widget> _toggleList = [
    FaIcon(FontAwesomeIcons.volumeUp, color: color2, size: 25,),
    Icon(Icons.vibration, color: color2, size: 28,),
    Icon(Icons.phonelink_ring_rounded, color: color2, size: 28,),
    FaIcon(FontAwesomeIcons.volumeMute, color: color2, size: 25,),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: color3, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            widget.name,
            style: TextStyle(color: color2, fontWeight: FontWeight.bold),
          ),
          Row(
            children: <Widget>[
              Text(
                widget.time,
                style:
                    TextStyle(color: color2, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Consumer<NotificationModel>(
                builder: (context, obj, child) {
                  return GestureDetector(
                    onTap: () {
                      obj.saveToggle(widget.name.toLowerCase()+'_index');
                    },
                    child: Container(
                      child: _toggleList[widget.toggleIndex],
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
