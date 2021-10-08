import 'package:flutter/material.dart';

class prayerContainer extends StatefulWidget {
  final String name;
  final String time;

  prayerContainer(this.name, this.time);

  @override
  _prayerContainerState createState() => _prayerContainerState();
}

class _prayerContainerState extends State<prayerContainer> {
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentToggleIndex = (currentToggleIndex + 1) % 3;
                  });
                },
                child: Container(
                  child: _toggleList[currentToggleIndex],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// Widget prayerContainer(String name, String time) {

