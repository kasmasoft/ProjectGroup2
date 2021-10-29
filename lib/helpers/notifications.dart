// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// import 'package:prayer_time_application/main.dart';
// // import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// void scheduleNotification() async {

//   final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
//   tz.setLocalLocation(tz.getLocation(timeZoneName!));

//   const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails('your channel id', 'your channel name',
//           channelDescription: 'your channel description',
//           importance: Importance.max,
//           priority: Priority.high,
//           ticker: 'ticker',
//           sound: RawResourceAndroidNotificationSound('azan1'),);
//   const NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);
//   await flutterLocalNotificationsPlugin.show(
//       0, 'plain title', 'plain body', platformChannelSpecifics,
//       payload: 'item x');

//   await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       'scheduled title',
//       'scheduled body',
//       tz.TZDateTime.now(tz.local).add(const Duration(seconds: 15)),
//       const NotificationDetails(
//           android: AndroidNotificationDetails(
//               'your channel id', 'your channel name',
//               channelDescription: 'your channel description')),
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime);
// }


