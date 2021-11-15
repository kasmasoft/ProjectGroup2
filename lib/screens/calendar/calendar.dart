// import 'package:firebase_auth/firebase_auth.dart';
import 'package:prayer_time_application/providers/auth_provider.dart';
import 'package:vibration/vibration.dart';
// Import package
import 'package:flutter/material.dart';
import 'package:prayer_time_application/providers/notification_model.dart';
import 'package:prayer_time_application/services/database_services.dart';
import 'package:provider/provider.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);
  static String routeName = "/calendar";

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DatabaseServices database = DatabaseServices();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<NotificationModel>(
        builder: (context, obj, child) {
          return Consumer<AuthProvider>(
            builder: (context, obj, child) {
              return ElevatedButton(
                child: Text('Logout'),
                onPressed: () {
                  obj.logoutCurrUser();
                },
              );
            },
          );
        },
      ),
    );
  }
}
