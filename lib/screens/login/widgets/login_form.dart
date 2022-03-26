import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/net/flutterfire.dart';
import 'package:prayer_time_application/screens/forgot/forgot_password.dart';
import 'package:prayer_time_application/screens/register/register_screen.dart';
import 'package:prayer_time_application/services/database_services.dart';

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
                style: TextStyle(fontSize: 15, color: color2),
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
                        print(user);
                        if (user != null) {
                          Navigator.pushNamedAndRemoveUntil(context, "/home",
                              (Route<dynamic> route) => false);
                        }
                      }
                    },
                  ),
                )),
            Container(
                child: Row(
              children: <Widget>[
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(fontSize: 15, color: color2),
                ),
                TextButton(
                  child: Text(
                    'SignUp',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterScreen.routeName);
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )),
            Row(children: <Widget>[
              Expanded(
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "OR",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                  child: Divider(
                color: Colors.white,
              )),
            ]),
            SizedBox(
              height: 10.0,
            ),
            // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //   InkWell(
            //     onTap: () async {
            //       User? user =
            //           await FireAuth.signInWithGoogle(context: context);
            //       if (user != null) {
            //         DatabaseServices db = DatabaseServices();
            //         db.initToggle(user.uid);
            //         Navigator.pushNamedAndRemoveUntil(
            //             context, "/home", (Route<dynamic> route) => false);
            //       }
            //     },
            //     child: Ink(
            //       color: Color(0xFF397AF3),
            //       child: Padding(
            //         padding: EdgeInsets.all(8),
            //         child: Wrap(
            //           crossAxisAlignment: WrapCrossAlignment.center,
            //           children: [
            //             Image.asset(
            //               "assets/images/google.jpg",
            //               width: 35,
            //               height: 35,
            //             ),
            //             SizedBox(width: 12),
            //             Text(
            //               'Sign in with Google',
            //               style: TextStyle(color: Colors.white, fontSize: 18),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ]),

            OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              onPressed: () async {
                User? user =
                      await FireAuth.signInWithGoogle(context: context);
                  if (user != null) {
                    DatabaseServices db = DatabaseServices();
                    db.initToggle(user.uid);
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/home", (Route<dynamic> route) => false);
                  }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Image(
                      image: AssetImage("assets/images/google_logo.jpg"),
                      height: 30.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
