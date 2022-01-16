import 'package:flutter/widgets.dart';
import 'package:prayer_time_application/screens/fast_tracker/fast_tracker.dart';
import 'package:prayer_time_application/screens/halal_food/halal_food.dart';
import 'package:prayer_time_application/screens/home/Home_Screen.dart';
import 'package:prayer_time_application/screens/mosque_search/mosque_search.dart';
import 'package:prayer_time_application/screens/qibla_compass/qiblah_screen.dart';
import 'package:prayer_time_application/screens/settings/setting_screen.dart';
import 'package:prayer_time_application/screens/prayer_tracker/tracker.dart';
import 'package:prayer_time_application/screens/settings/widgets/methods_settings.dart';
import 'package:prayer_time_application/screens/settings/widgets/prayer_time_settings.dart';
import 'screens/forgot/forgot_password.dart';
import 'screens/prayers/prayers.dart';
import 'screens/profile/profile.dart';
import 'screens/more/more.dart';
import 'screens/register/register_screen.dart';
import 'screens/login/login_screen.dart';

import '/screens/splash/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  Home.routeName: (context) => Home(),
  MosqueScreen.routeName: (context) => MosqueScreen(),
  QiblahCompassScreen.routeName: (context) => QiblahCompassScreen(),
  More.routeName: (context) => More(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  Prayers.routeName: (context) => Prayers(),
  UserProfile.routeName: (context) => UserProfile(),
  SettingPage.routeName: (context) => SettingPage(),
  PrayerTracker.routeName: (context) => PrayerTracker(),
  FastTracker.routeName: (context) => FastTracker(),
  PrayerTimeSettings.routeName: (context) => PrayerTimeSettings(),
  HalalFoodSearch.routeName: (context) => HalalFoodSearch(),
  MethodSettings.routeName: (context) => MethodSettings(),
};