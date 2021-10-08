import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({ Key? key }) : super(key: key);
  static String routeName = "/calendar";

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Logout'),
        onPressed: () {
          FirebaseAuth.instance.signOut();
        },
      ),
    );
  }
}