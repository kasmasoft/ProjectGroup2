import 'package:flutter/widgets.dart';
import '/screens/calendar.dart';
import '/screens/forgot_password.dart';
import '/screens/prayers.dart';
import '/screens/profile.dart';
import '/screens/Home_screen.dart';
import '/screens/more.dart';
import '/screens/register_screen.dart';
import '/screens/login_screen.dart';

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