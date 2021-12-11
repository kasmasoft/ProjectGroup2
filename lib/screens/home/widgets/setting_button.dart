import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/screens/settings/setting_screen.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(
            Icons.settings,
            color: color2,
            size: 34,
          ),
          onPressed: () {
            // do something
            Navigator.pushNamed(context, SettingPage.routeName);
          },
        ),
      ],
    );
  }
}
