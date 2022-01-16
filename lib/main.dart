// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/providers/application_bloc.dart';
import 'package:prayer_time_application/providers/auth_provider.dart';
import 'package:prayer_time_application/providers/main_model.dart';
import 'package:prayer_time_application/providers/notification_model.dart';
import 'package:prayer_time_application/screens/home/Home_Screen.dart';
import 'package:provider/provider.dart';
import 'routes.dart';
import 'screens/splash/splash_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'helpers/notifications_helper.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final FlutterLocalNotificationsPlugin notifsPlugin =
    FlutterLocalNotificationsPlugin();

///Receive message when app is in background solution for on message
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  NotificationAppLaunchDetails notifLaunch;
  notifLaunch = (await notifsPlugin.getNotificationAppLaunchDetails())!;
  await initNotifications(notifsPlugin);
  requestIOSPermissions(notifsPlugin);

  // const AndroidInitializationSettings initializationSettingsAndroid =
  //     AndroidInitializationSettings('app_logo');
  // final IOSInitializationSettings initializationSettingsIOS =
  //     IOSInitializationSettings(
  //         requestSoundPermission: true,
  //         requestBadgePermission: false,
  //         requestAlertPermission: true);
  // final InitializationSettings initializationSettings = InitializationSettings(
  //     android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  // await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MainModel()),
          ChangeNotifierProvider(create: (context) => NotificationModel()),
          ChangeNotifierProvider(create: (context) => AuthProvider()),
          ChangeNotifierProvider(create: (context) => ApplicationBloc()),
        ],
        child: Consumer<AuthProvider>(
          builder: (context, obj, child) {
            return MaterialApp(
              title: 'Prayer Time App',
              theme: ThemeData(
                primaryColor: color2,
                scaffoldBackgroundColor: color3,
                colorScheme: ColorScheme.fromSwatch(accentColor: color2, primarySwatch: Colors.yellow)
                    .copyWith(secondary: color2),
              ),
              initialRoute: obj.isAuthenticated == false? SplashScreen.routeName: Home.routeName,
              routes: routes,
              debugShowCheckedModeBanner: false,
            );
          },
        ));
  }
}

// command 
// --no-sound-null-safety
