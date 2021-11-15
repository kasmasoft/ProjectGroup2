import 'package:flutter/material.dart';
import 'package:prayer_time_application/providers/auth_provider.dart';
import 'package:prayer_time_application/screens/home/Home_screen.dart';
import 'package:provider/provider.dart';
import 'size_config.dart';
import 'body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Consumer<AuthProvider>(
      builder: (context, obj, child){
        return Scaffold(
          body: obj.isAuthenticated == false? Body(): HomeScreen(),
        );
      },
    );
  }
}
