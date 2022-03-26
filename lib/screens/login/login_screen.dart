import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';
import 'widgets/login_form.dart';


class LoginScreen extends StatelessWidget {
  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: _size.height,
          width: _size.width,
          child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 200,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: // Text(
                    //   'Musalla',
                    //   style: TextStyle(
                    //       color: color2,
                    //       fontWeight: FontWeight.w500,
                    //       fontSize: 30),
                    // )
                    Image.asset('assets/images/launcher.png'),
                  ),
                  LoginForm(),
                ],
              )),
        ));
  }
}