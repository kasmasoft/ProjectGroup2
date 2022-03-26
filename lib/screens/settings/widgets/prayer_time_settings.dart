import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/helpers/app_preference.dart';

class PrayerTimeSettings extends StatefulWidget {
  const PrayerTimeSettings({Key? key}) : super(key: key);
  static String routeName = "/prayertimesettings";

  @override
  _PrayerTimeSettingsState createState() => _PrayerTimeSettingsState();
}

class _PrayerTimeSettingsState extends State<PrayerTimeSettings> {
  CalculationMethod _method = CalculationMethod.kuwait;
  Madhab _madhab = Madhab.hanafi;
  @override
  void initState() {
    super.initState();
    AppPreference.getCalculationMethod().then((value) {
      if (value != null) {
        print(value);
        setState(() {
          _method = value;
        });
      }
    });
    AppPreference.getMadhab().then((value) {
      print(value);
      if (value != null) {
        setState(() {
          _madhab = value;
        });
      }
    });
  }

  _buildMadhabDropDown() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(20),
      child: DropdownButtonHideUnderline(
        child: GFDropdown(
          padding: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(10),
          border: const BorderSide(color: Colors.white, width: 1),
          dropdownColor: color2,
          iconEnabledColor: Colors.white,
          dropdownButtonColor: color2,
          style: TextStyle(color: Colors.white),
          value: _madhab,
          onChanged: (newValue) async {
            await AppPreference.setMadhab(newValue as Madhab);
            setState(() {
              _madhab = newValue;
            });
          },
          items: [
            DropdownMenuItem(child: Text("Hanafi"), value: Madhab.hanafi),
            DropdownMenuItem(child: Text("Shafi"), value: Madhab.shafi)
          ],
        ),
      ),
    );
  }

  _buildCalculationMethod() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(20),
      child: DropdownButtonHideUnderline(
        child: GFDropdown(
          padding: const EdgeInsets.all(10),
          borderRadius: BorderRadius.circular(10),
          border: const BorderSide(color: Colors.white, width: 1),
          dropdownColor: color2,
          iconEnabledColor: Colors.white,
          dropdownButtonColor: color2,
          style: TextStyle(color: Colors.white),
          value: _method,
          onChanged: (value) async {
            await AppPreference.setCalculationMethod(
                value as CalculationMethod);
            setState(() {
              _method = value;
            });
          },
          items: [
            DropdownMenuItem(
              child: Text("UAE"),
              value: CalculationMethod.dubai,
            ),
            DropdownMenuItem(
              child: Text("Muslim World League"),
              value: CalculationMethod.muslim_world_league,
            ),
            DropdownMenuItem(
                child: Text("Egyptian General Authority"),
                value: CalculationMethod.egyptian),
            DropdownMenuItem(
                child: Text("University of Islamic Sciences, Karachi"),
                value: CalculationMethod.karachi),
            DropdownMenuItem(
                child: Text("Kuwait"), value: CalculationMethod.kuwait),
            DropdownMenuItem(
                child: Text("Moonsighting Committee"),
                value: CalculationMethod.moon_sighting_committee),
            DropdownMenuItem(
                child: Text("Singapore"), value: CalculationMethod.singapore),
            DropdownMenuItem(
                child: Text("ISNA"), value: CalculationMethod.north_america),
            DropdownMenuItem(
                child: Text("Fajr angle: 0, Isha angle: 0."),
                value: CalculationMethod.other),
            DropdownMenuItem(
                child: Text("Umm al-Qura used in Qatar."),
                value: CalculationMethod.qatar),
            DropdownMenuItem(
                child: Text("Umm al-Qura University, Makkah"),
                value: CalculationMethod.umm_al_qura)
          ],
        ),
      ),
    );
  }

  // _buildCalculationMethod() {
  //   return Row(
  //     children: [
  //       Expanded(
  //         flex: 1,
  //         child: DropdownButtonHideUnderline(
  //           child: DropdownButton(
  //               iconEnabledColor: color2,
  //               isExpanded: true,
  //               style: TextStyle(color: color2, fontSize: 20),
  //               dropdownColor: color1,
  //               value: _method,
  //               items: [
  //                 DropdownMenuItem(
  //                   child: Text("UAE"),
  //                   value: CalculationMethod.dubai,
  //                 ),
  //                 DropdownMenuItem(
  //                   child: Text("Muslim World League"),
  //                   value: CalculationMethod.muslim_world_league,
  //                 ),
  //                 DropdownMenuItem(
  //                     child: Text("Egyptian General Authority"),
  //                     value: CalculationMethod.egyptian),
  //                 DropdownMenuItem(
  //                     child: Text("University of Islamic Sciences, Karachi"),
  //                     value: CalculationMethod.karachi),
  //                 DropdownMenuItem(
  //                     child: Text("Kuwait"), value: CalculationMethod.kuwait),
  //                 DropdownMenuItem(
  //                     child: Text("Moonsighting Committee"),
  //                     value: CalculationMethod.moon_sighting_committee),
  //                 DropdownMenuItem(
  //                     child: Text("Singapore"),
  //                     value: CalculationMethod.singapore),
  //                 DropdownMenuItem(
  //                     child: Text("ISNA"),
  //                     value: CalculationMethod.north_america),
  //                 DropdownMenuItem(
  //                     child: Text("Fajr angle: 0, Isha angle: 0."),
  //                     value: CalculationMethod.other),
  //                 DropdownMenuItem(
  //                     child: Text("Umm al-Qura used in Qatar."),
  //                     value: CalculationMethod.qatar),
  //                 DropdownMenuItem(
  //                     child: Text("Umm al-Qura University, Makkah"),
  //                     value: CalculationMethod.umm_al_qura)
  //               ],
  //               onChanged: (value) async {
  //                 await AppPreference.setCalculationMethod(
  //                     value as CalculationMethod);
  //                 setState(() {
  //                   _method = value;
  //                 });
  //               }),
  //         ),
  //       )
  //     ],
  //   );
  // }

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
          "Prayer Times",
          style: TextStyle(color: color2),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Title(
                      color: Colors.white,
                      child: Text(
                        'Calculation method',
                        style: TextStyle(color: color2, fontSize: 22),
                      )),
                  _buildCalculationMethod(),
                  SizedBox(
                    height: 32,
                  ),
                  Title(
                      color: Colors.white,
                      child: Text(
                        'Change Madhab',
                        style: TextStyle(color: color2, fontSize: 22),
                      )),
                  _buildMadhabDropDown(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 'egyptian', 'kuwait', 'dubai', 'muslim_world_league', 'north_america', 'qatar', 'singapore', 'tehran', 'moon_sighting_committee', 'other'
//  Container(
//           child: Column(
//             children: [
//               ListTileTheme(
//                 textColor: Colors.white, 
//               ),
//               GFRadioListTile(
//                 titleText: 'egyptian',
//                 subTitleText: 'Egyptian General Authority of Survey Uses Fajr angle of 19.5 and an Isha angle of 17.5',
//                 inactiveBgColor: Colors.white,
//                 activeBgColor: color3,
//                 size: 30,
//                 radioColor: color2,
//                 activeBorderColor: color2,
//                 focusColor: color2,
//                 type: GFRadioType.basic,
//                 value: 1,
//                 groupValue: groupValue,
//                 onChanged: (value) {
//                   setState(() {
//                     groupValue = value;
//                   });
//                 },
//                 inactiveIcon: null,
//               ),
//               GFRadioListTile(
//                 titleText: 'kuwait',
//                 subTitleText: 'Kuwait Uses a Fajr angle of 18 and an Isha angle of 17.5',
//                 inactiveBgColor: Colors.white,
//                 activeBgColor: color3,
//                 size: 30,
//                 radioColor: color2,
//                 activeBorderColor: color2,
//                 focusColor: color2,
//                 type: GFRadioType.basic,
//                 value: 2,
//                 groupValue: groupValue,
//                 onChanged: (value) {
//                   setState(() {
//                     groupValue = value;
//                   });
//                 },
//                 inactiveIcon: null,
//               ),
//               GFRadioListTile(
//                 titleText: 'dubai',
//                 subTitleText: 'The Gulf Region Uses Fajr and Isha angles of 18.2 degrees.',
//                 inactiveBgColor: Colors.white,
//                 activeBgColor: color3,
//                 size: 30,
//                 radioColor: color2,
//                 activeBorderColor: color2,
//                 focusColor: color2,
//                 type: GFRadioType.basic,
//                 value: 3,
//                 groupValue: groupValue,
//                 onChanged: (value) {
//                   setState(() {
//                     groupValue = value;
//                   });
//                 },
//                 inactiveIcon: null,
//               ),
//               GFRadioListTile(
//                 titleText: 'muslim_world_league',
//                 subTitleText: 'Muslim World League Uses Fajr angle of 18 and an Isha angle of 17',
//                 inactiveBgColor: Colors.white,
//                 activeBgColor: color3,
//                 size: 30,
//                 radioColor: color2,
//                 activeBorderColor: color2,
//                 focusColor: color2,
//                 type: GFRadioType.basic,
//                 value: 4,
//                 groupValue: groupValue,
//                 onChanged: (value) {
//                   setState(() {
//                     groupValue = value;
//                   });
//                 },
//                 inactiveIcon: null,
//               ),
//               GFRadioListTile(
//                 titleText: 'north_america',
//                 subTitleText: 'Referred to as the ISNA method This method is included for completeness, but is not recommended. Uses a Fajr angle of 15 and an Isha angle of 15.',
//                 inactiveBgColor: Colors.white,
//                 activeBgColor: color3,
//                 size: 30,
//                 radioColor: color2,
//                 activeBorderColor: color2,
//                 focusColor: color2,
//                 type: GFRadioType.basic,
//                 value: 5,
//                 groupValue: groupValue,
//                 onChanged: (value) {
//                   setState(() {
//                     groupValue = value;
//                   });
//                 },
//                 inactiveIcon: null,
//               ),
//               GFRadioListTile(
//                 titleText: 'qatar',
//                 subTitleText: 'Qatar Modified version of Umm al-Qura that uses a Fajr angle of 18.',
//                 inactiveBgColor: Colors.white,
//                 activeBgColor: color3,
//                 size: 30,
//                 radioColor: color2,
//                 activeBorderColor: color2,
//                 focusColor: color2,
//                 type: GFRadioType.basic,
//                 value: 6,
//                 groupValue: groupValue,
//                 onChanged: (value) {
//                   setState(() {
//                     groupValue = value;
//                   });
//                 },
//                 inactiveIcon: null,
//               ),
//               GFRadioListTile(
//                 titleText: 'singapore',
//                 subTitleText: 'Singapore Uses a Fajr angle of 20 and an Isha angle of 18',
//                 inactiveBgColor: Colors.white,
//                 activeBgColor: color3,
//                 size: 30,
//                 radioColor: color2,
//                 activeBorderColor: color2,
//                 focusColor: color2,
//                 type: GFRadioType.basic,
//                 value: 7,
//                 groupValue: groupValue,
//                 onChanged: (value) {
//                   setState(() {
//                     groupValue = value;
//                   });
//                 },
//                 inactiveIcon: null,
//               ),
//               GFRadioListTile(
//                 titleText: 'tehran',
//                 subTitleText: 'Institute of Geophysics, University of Tehran. Early Isha time with an angle of 14°. Slightly later Fajr time with an angle of 17.7°. Calculates Maghrib based on the sun reaching an angle of 4.5° below the horizon.',
//                 inactiveBgColor: Colors.white,
//                 activeBgColor: color3,
//                 size: 30,
//                 radioColor: color2,
//                 activeBorderColor: color2,
//                 focusColor: color2,
//                 type: GFRadioType.basic,
//                 value: 8,
//                 groupValue: groupValue,
//                 onChanged: (value) {
//                   setState(() {
//                     groupValue = value;
//                   });
//                 },
//                 inactiveIcon: null,
//               ),
//               GFRadioListTile(
//                 titleText: 'moon_sighting_committee',
//                 subTitleText: 'Moon Sighting Committee Uses a Fajr angle of 18 and an Isha angle of 18. Also uses seasonal adjustment values.',
//                 inactiveBgColor: Colors.white,
//                 activeBgColor: color3,
//                 size: 30,
//                 radioColor: color2,
//                 activeBorderColor: color2,
//                 focusColor: color2,
//                 type: GFRadioType.basic,
//                 value: 9,
//                 groupValue: groupValue,
//                 onChanged: (value) {
//                   setState(() {
//                     groupValue = value;
//                   });
//                 },
//                 inactiveIcon: null,
//               ),
//               GFRadioListTile(
//                 titleText: 'other',
//                 subTitleText: 'The default value for [CalculationParameters.method] when initializing a [CalculationParameters] object. Sets a Fajr angle of 0 and an Isha angle of 0.',
//                 inactiveBgColor: Colors.white,
//                 activeBgColor: color3,
//                 size: 30,
//                 radioColor: color2,
//                 activeBorderColor: color2,
//                 focusColor: color2,
//                 type: GFRadioType.basic,
//                 value: 10,
//                 groupValue: groupValue,
//                 onChanged: (value) {
//                   setState(() {
//                     groupValue = value;
//                   });
//                 },
//                 inactiveIcon: null,
//               ),
//             ],
//           ),
//         ),
