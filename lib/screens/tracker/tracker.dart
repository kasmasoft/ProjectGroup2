import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/screens/tracker/widgets/calendar.dart';

class PrayerTracker extends StatefulWidget {
  const PrayerTracker({Key? key}) : super(key: key);
  static String routeName = "/tracker";

  @override
  _PrayerTrackerState createState() => _PrayerTrackerState();
}

class _PrayerTrackerState extends State<PrayerTracker> {
  List<CheckBoxListTileModel> checkBoxListTileModel =
      CheckBoxListTileModel.getUsers();

  void itemChange(bool val, int index) {
    setState(() {
      checkBoxListTileModel[index].isCheck = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      /*appBar: new AppBar(
        backgroundColor: color1,
        centerTitle: true,
        title: new Text(
          'Salah Tracker',
          style: TextStyle(color: color2),
        ),
      ),*/
      //
      body: TableEventsExample(),
    );
  }
}

// body: new ListView.builder(
//           itemCount: checkBoxListTileModel.length,
//           itemBuilder: (BuildContext context, int index) {
//             return new Card(
//               child: new Container(
//                 color: color1,
//                 padding: new EdgeInsets.all(10.0),
//                 child: Column(
//                   children: <Widget>[
//                     new CheckboxListTile(
//                         activeColor: color2,
//                         dense: true,

//                         //font change
//                         title: new Text(
//                           checkBoxListTileModel[index].title,
//                           style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600,
//                               letterSpacing: 0.5,
//                               color: color2),
//                         ),
//                         value: checkBoxListTileModel[index].isCheck,
//                         /*secondary: Container(
//                           height: 50,
//                           width: 50,
//                           color: color1,
//                         ),*/
//                         onChanged: (bool? val) {
//                           itemChange(val!, index);
//                         })
//                   ],
//                 ),
//               ),
//             );
//           }),

class CheckBoxListTileModel {
  int userId;

  String title;
  bool isCheck;

  CheckBoxListTileModel(
      {required this.userId,
      //required this.img,
      required this.title,
      required this.isCheck});

  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(userId: 1, title: "Fajr", isCheck: false),
      CheckBoxListTileModel(userId: 2, title: "Dhuhr", isCheck: false),
      CheckBoxListTileModel(userId: 3, title: "Asr", isCheck: false),
      CheckBoxListTileModel(userId: 4, title: "Maghrib", isCheck: false),
      CheckBoxListTileModel(userId: 5, title: "Isha", isCheck: false),
    ];
  }
}
