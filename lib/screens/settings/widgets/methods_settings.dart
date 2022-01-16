import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:prayer_time_application/constants.dart';

class MethodSettings extends StatefulWidget {
  const MethodSettings({ Key? key }) : super(key: key);
  static String routeName = "/methods";

  @override
  _MethodSettingsState createState() => _MethodSettingsState();
}

class _MethodSettingsState extends State<MethodSettings> {
  int groupValue = 0;
  static List<String> titles = [
    'karachi',
    'egyptian',
    'kuwait',
    'dubai',
    'muslim world league',
    'north america',
    'qatar',
    'singapore',
    'tehran',
    'moon sighting committee',
    'other'
  ];
  static List<String> subtitles = [
    'University of Islamic Sciences, Karachi Uses Fajr angle of 18 and an Isha angle of 18',
    'Egyptian General Authority of Survey Uses Fajr angle of 19.5 and an Isha angle of 17.5',
    'Kuwait Uses a Fajr angle of 18 and an Isha angle of 17.5',
    'The Gulf Region Uses Fajr and Isha angles of 18.2 degrees.',
    'Muslim World League Uses Fajr angle of 18 and an Isha angle of 17',
    'Referred to as the ISNA method This method is included for completeness, but is not recommended. Uses a Fajr angle of 15 and an Isha angle of 15.',
    'Qatar Modified version of Umm al-Qura that uses a Fajr angle of 18.',
    'Singapore Uses a Fajr angle of 20 and an Isha angle of 18',
    'Institute of Geophysics, University of Tehran. Early Isha time with an angle of 14°. Slightly later Fajr time with an angle of 17.7°. Calculates Maghrib based on the sun reaching an angle of 4.5° below the horizon.',
    'Moon Sighting Committee Uses a Fajr angle of 18 and an Isha angle of 18. Also uses seasonal adjustment values.',
    'The default value for [CalculationParameters.method] when initializing a [CalculationParameters] object. Sets a Fajr angle of 0 and an Isha angle of 0.',
  ];
  final List<Map<String, dynamic>> _items = List.generate(
      11,
      (index) =>
          {"id": index, "title": titles[index], "subtitle": subtitles[index]});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: color2, //change your color here
        ),
        backgroundColor: color1,
        centerTitle: true,
        title: Text(
          "Prayer Calculation Methods",
          style: TextStyle(color: color2),
        ),
      ),
      body: Container(
        child: ListTileTheme(
          textColor: Colors.white,
          tileColor: color2,
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (_, index) => GFRadioListTile(
              title: Text(_items[index]['title'], style: TextStyle(color: color2, fontSize: 22)),
              subTitle: Text(_items[index]['subtitle'], style: TextStyle(color: Colors.white)),
              inactiveBgColor: Colors.white,
              activeBgColor: color3,
              size: 30,
              radioColor: color2,
              activeBorderColor: color2,
              focusColor: color2,
              type: GFRadioType.basic,
              value: index,
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value;
                });
              },
              color: color1,
              inactiveIcon: null,
            ),
          ),
        ),
      ),
    );
  }
}