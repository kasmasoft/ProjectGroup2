import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as notifs;
import 'package:rxdart/subjects.dart' as rxSub;

final rxSub.BehaviorSubject<NotificationClass>
    didReceiveLocalNotificationSubject =
    rxSub.BehaviorSubject<NotificationClass>();
final rxSub.BehaviorSubject<String> selectNotificationSubject =
    rxSub.BehaviorSubject<String>();

Future<void> initNotifications(
    notifs.FlutterLocalNotificationsPlugin notifsPlugin) async {
  var initializationSettingsAndroid =
      notifs.AndroidInitializationSettings('ic_launcher');
      
  var initializationSettingsIOS = notifs.IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int? id, String? title, String? body, String? payload) {
        didReceiveLocalNotificationSubject.add(NotificationClass(
            id: id!, title: title!, body: body!, payload: payload!));
      });
  var initializationSettings = notifs.InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await notifsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) {
    if (payload != null) {
      print('notification payload: ' + payload);
    }
    selectNotificationSubject.add(payload!);
  });
  print("Notifications initialised successfully");
}

void requestIOSPermissions(
    notifs.FlutterLocalNotificationsPlugin notifsPlugin) {
  notifsPlugin
      .resolvePlatformSpecificImplementation<
          notifs.IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
}

Future<void> scheduleNotification(
      {notifs.FlutterLocalNotificationsPlugin? notifsPlugin,
      String? id,
      String? title,
      String? body,
      DateTime? scheduledTime}) async {
    var androidSpecifics = notifs.AndroidNotificationDetails(
      id!, // This specifies the ID of the Notification
      'Scheduled notification', // This specifies the name of the notification channel
      icon: 'icon',
      channelDescription:
          'A scheduled notification', //This specifies the description of the channel
    );
    var iOSSpecifics = notifs.IOSNotificationDetails();
    var platformChannelSpecifics = notifs.NotificationDetails(
        android: androidSpecifics, iOS: iOSSpecifics);
    final nid = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    await notifsPlugin!.schedule(
        nid,
        title,
        "Scheduled notification",
        scheduledTime!,
        platformChannelSpecifics); // This literally schedules the notification
  }

class NotificationClass {
  final int id;
  final String title;
  final String body;
  final String payload;
  NotificationClass(
      {required this.id,
      required this.body,
      required this.payload,
      required this.title});
}
