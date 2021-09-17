import 'package:flutter/material.dart';
import 'prayers.dart';
import 'calendar.dart';
import '../widgets/home.dart';
import '../widgets/more.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
   List<Widget> _widgetOptions = <Widget>[
    Home(),
    Calendar(),
    Prayers(),
    Home(),
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
              title: SizedBox.shrink(),
              activeIcon: Icon(
                Icons.home,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                size: 30,
              ),
              title: SizedBox.shrink(),
              activeIcon: Icon(
                Icons.calendar_today,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.task_alt_outlined,
                size: 30,
              ),
              title: SizedBox.shrink(),
              activeIcon: Icon(
                Icons.task_alt_outlined,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return More();
                    }
                  );
                },
                child: Icon(
                  Icons.more_horiz_outlined,
                  size: 30,
                ),
              ),
              title: SizedBox.shrink(),
              activeIcon: Icon(
                Icons.more_horiz_outlined,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
