import 'package:flutter/widgets.dart';
import 'screens/calendar/calendar.dart';
import 'screens/forgot/forgot_password.dart';
import 'screens/prayers/prayers.dart';
import 'screens/profile/profile.dart';
import 'screens/home/Home_screen.dart';
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
  HomeScreen.routeName: (context) => HomeScreen(),
  More.routeName: (context) => More(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  Calendar.routeName: (context) => Calendar(),
  Prayers.routeName: (context) => Prayers(),
  UserProfile.routeName: (context) => UserProfile(),
};