import 'package:flutter/material.dart';
import 'package:prayer_time_application/providers/notification_model.dart';
import 'package:provider/provider.dart';

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
    Icon(Icons.alarm, color: Colors.white),
    Icon(Icons.vibration, color: Colors.white),
    Icon(Icons.phonelink_ring_rounded, color: Colors.white),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Color(0xFF8133d4), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            widget.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            children: <Widget>[
              Text(
                widget.time,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
