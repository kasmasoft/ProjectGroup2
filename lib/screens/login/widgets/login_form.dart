import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/net/flutterfire.dart';
import 'package:prayer_time_application/screens/forgot/forgot_password.dart';
import 'package:prayer_time_application/screens/home/Home_Screen.dart';
import 'package:prayer_time_application/screens/register/register_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: emailController,
                style: TextStyle(color: color2),
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: color2, width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: color2, width: 2.0)),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: color2),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                obscureText: true,
                style: TextStyle(color: color2),
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: color2, width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: color2, width: 2.0)),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: color2),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, ForgotPassword.routeName);
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                    fontSize: 15, color: color2),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
                height: 50,
                width: 400,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SizedBox(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                      primary: Colors.white,
                      backgroundColor: color2,
                    ),
                    child: Text('Login'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        User? user = await FireAuth.signInUsingEmailPassword(
                          email: emailController.text,
                          password: passwordController.text,
                          context: context,
                        );
                        if (user != null) {
                          Navigator.pushNamed(context, Home.routeName);
                        }
                      }
                    },
                  ),
                )),
            Container(
                child: Row(
              children: <Widget>[
                Text('Don\'t have an account?', style: TextStyle(
                        fontSize: 15, color: color2),),
                TextButton(
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                        fontSize: 15, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterScreen.routeName);
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ))
          ],
        ));
  }
}
