import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/net/validator.dart';

class ForgotPassword extends StatelessWidget {
  static String routeName = "/forgot";
  final _forgotformKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  void passwordReset(email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
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
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Form(
                    key: _forgotformKey,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            style: TextStyle(color: color2),
                            controller: emailController,
                            decoration: new InputDecoration(
                              border: new OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: color2, width: 2.0)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: color2, width: 2.0)),
                              labelText: 'Email',
                              labelStyle: TextStyle(color: color2),
                            ),
                            validator: (value) =>
                              Validator.validateEmail(email: value.toString()),
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
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                ),
                                child: Text('Continue'),
                                onPressed: () {
                                  passwordReset(emailController.text);
                                },
                              ),
                            )),
                      ],
                    )),
              ],
            )),
      ),
    );
  }
}
