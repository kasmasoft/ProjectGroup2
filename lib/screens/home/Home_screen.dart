import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/helpers/local_notification_services.dart';
import '../prayers/prayers.dart';
import '../calendar/calendar.dart';
import 'widgets/home.dart';
import '../more/more.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = "/";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;

  void initState() {
    super.initState();

    ///gives you the message on which user taps
    ///and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if(message != null){
        final routeFromMessage = message.data["route"];

        Navigator.of(context).pushNamed(routeFromMessage);
      }
    });

    ///forground work
    FirebaseMessaging.onMessage.listen((message) {
      if(message.notification != null){
        print(message.notification!.body);
        print(message.notification!.title);
      }

      LocalNotificationService.display(message);
    });

    
    ///When the app is in background but opened and user taps
    ///on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];

      Navigator.of(context).pushNamed(routeFromMessage);
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Calendar(),
    Prayers(),
    More(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_currentTab],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Color(0xFF37b89a),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentTab,
          type: BottomNavigationBarType.fixed,
          onTap: (int value) {
            setState(() {
              _currentTab = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              // ignore: deprecated_member_use
              title: SizedBox.shrink(),
              activeIcon: Icon(
                Icons.home,
                size: 30,
                color: color17,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                size: 30,
              ),
              // ignore: deprecated_member_use
              title: SizedBox.shrink(),
              activeIcon: Icon(
                Icons.calendar_today,
                size: 30,
                color: color17,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.task_alt_outlined,
                size: 30,
              ),
              // ignore: deprecated_member_use
              title: SizedBox.shrink(),
              activeIcon: Icon(
                Icons.task_alt_outlined,
                size: 30,
                color: color17,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.more_horiz_outlined,
                size: 30,
              ),
              // ignore: deprecated_member_use
              title: SizedBox.shrink(),
              activeIcon: Icon(
                Icons.more_horiz_outlined,
                size: 30,
                color: color17,
              ),
            )
          ],
        ),
      ),
    );
  }
}
