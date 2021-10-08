import 'package:flutter/material.dart';

class CustomeIcon extends StatelessWidget {
  final IconData _icon;
  final String _title;
  const CustomeIcon(this._icon, this._title);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: Colors.grey[350],
        elevation: 2.0,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Icon(
                _icon,
                color: Theme.of(context).primaryColor,
                size: 50.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                _title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
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
