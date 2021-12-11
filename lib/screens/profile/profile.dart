import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:prayer_time_application/providers/auth_provider.dart';
import 'package:prayer_time_application/providers/notification_model.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);
  static String routeName = "/profile";

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final database = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<NotificationModel>(
          builder: (context, obj, child) {
            return Consumer<AuthProvider>(
              builder: (context, obj, child) {
                return ElevatedButton(
                  child: Text('Logout'),
                  onPressed: () {
                    obj.logoutCurrUser();
                    // scheduleNotification(
                    //     notifsPlugin:
                    //         notifsPlugin, //Or whatever you've named it in main.dart
                    //     id: DateTime.now()
                    //         .add(const Duration(minutes: 2))
                    //         .toString(),
                    //     body: "A scheduled Notification",
                    //     scheduledTime: DateTime
                    //         .now()); //Or whenever you actually want to trigger it
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
