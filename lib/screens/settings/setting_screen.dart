import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/screens/login/login_screen.dart';
import 'package:prayer_time_application/screens/profile/profile.dart';
import 'package:prayer_time_application/screens/settings/widgets/prayer_time_settings.dart';
import 'package:prayer_time_application/screens/splash/splash_screen.dart';
import 'package:rating_dialog/rating_dialog.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);
  static String routeName = "/setting";

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool valuefirst = true;
  bool valuesecond = false;
  bool valuetherd = false;
  bool valueFour = false;
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? username;
  User? cuser;

  @override
  void initState() {
    cuser = auth.currentUser;
    username = cuser!.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return cuser != null ? Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: color2, //change your color here
          ),
          backgroundColor: color1,
          centerTitle: true,
          title: Text(
            "Settings",
            style: TextStyle(color: color2),
          ),
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(6),
            child: Column(
              children: [
                Card(
                  color: color1,
                  child: ListTile(
                    onTap: () =>
                        Navigator.pushNamed(context, UserProfile.routeName),
                    leading: Icon(
                      Icons.person,
                      color: color2,
                      size: 40,
                    ),
                    title: Text(
                      "My Account",
                      style: TextStyle(
                        color: color2,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      "Logged in as $username",
                      style: TextStyle(color: color2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PrayerTimeSettings.routeName);
                  },
                  style: ElevatedButton.styleFrom(primary: color1),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Prayer Times',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: color2,
                          ),
                        ),
                        FaIcon(
                          FontAwesomeIcons.clock,
                          color: color2,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: color1),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Contact Us',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: color2,
                          ),
                        ),
                        Icon(
                          Icons.message_outlined,
                          color: color2,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: color1),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'About App',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: color2,
                          ),
                        ),
                        Icon(
                          Icons.info_outline,
                          color: color2,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Theme(
                              data: Theme.of(context)
                                  .copyWith(dialogBackgroundColor: color14),
                              child: RatingDialog(
                                starColor: color2,
                                title: Text(''),
                                message: Text(
                                  'Please rate our application',
                                  style: TextStyle(
                                    color: color2,
                                  ),
                                ),
                                image: const FlutterLogo(size: 100),
                                initialRating: 2,
                                submitButtonText: 'Submit',
                                enableComment: false,
                                onCancelled: () {},
                                onSubmitted: (response) {
                                  print(
                                      'rating: ${response.rating}, comment: ${response.comment}');
                                },
                              ));
                        });
                  },
                  style: ElevatedButton.styleFrom(primary: color1),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Rate Us',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: color2,
                          ),
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          color: color2,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.WARNING,
                        headerAnimationLoop: false,
                        animType: AnimType.TOPSLIDE,
                        title: 'Warning',
                        desc: 'Are you sure you want to Signout',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          auth.signOut();
                          Navigator.pushNamed(context, SplashScreen.routeName);
                          return;
                        }).show();
                  },
                  style: ElevatedButton.styleFrom(primary: color1),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Signout ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: color2,
                          ),
                        ),
                        Icon(
                          Icons.outbond_outlined,
                          color: color2,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ])))): LoginScreen();
  }
}
