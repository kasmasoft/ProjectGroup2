import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';

class CustomeIcon extends StatelessWidget {
  final IconData _icon;
  final String _title;
  const CustomeIcon(this._icon, this._title);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: color1,
        elevation: 2.0,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Icon(
                _icon,
                color: color2,
                size: 45.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                _title,
                style: TextStyle(
                    color: color2,
                    fontSize: 16.0),
              ),
              SizedBox(
                height: 5.0,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
