import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Home_screen.dart';
import '../net/flutterfire.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _registerFormKey = GlobalKey<FormState>();
  // final _focusName = FocusNode();
  // final _focusEmail = FocusNode();
  // final _focusPassword = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool _isProcessing = false;

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
                child: Text(
                  'Welcome',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )
              ),
              Form(
                key: _registerFormKey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: new InputDecoration(
                          border: new OutlineInputBorder(),
                          labelText: 'Name',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: emailController,
                        decoration: new InputDecoration(
                          border: new OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    _isProcessing? CircularProgressIndicator():
                    Container(
                        height: 50,
                        width: 400,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          child: Text('Sign Up'),
                          onPressed: () async {
                            setState(() {
                              _isProcessing = true;
                            });
                            if (_registerFormKey.currentState!
                                .validate()) {
                              User? user = await FireAuth
                                  .registerUsingEmailPassword(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              setState(() {
                                _isProcessing = false;
                              });
                              if (user != null) {
                                Navigator.of(context)
                                    .pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        HomeScreen(),
                                  ),
                                  ModalRoute.withName('/'),
                                );
                              }
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFF37b89a))),
                        )),
                    Container(
                        child: Row(
                      children: <Widget>[
                        Text('Allready have an account?'),
                        TextButton(
                          child: Text(
                            'login',
                            style: TextStyle(
                                fontSize: 15, color: Theme.of(context).primaryColor),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
                  ],
                )
              )
            ],
          )),
    ));
  }
}
