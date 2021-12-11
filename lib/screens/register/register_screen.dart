// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/screens/home/Home_Screen.dart';
import 'package:prayer_time_application/screens/login/login_screen.dart';
import '../../net/validator.dart';
import '../../net/flutterfire.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static String routeName = "/register";
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
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

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
                  height: 100,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                        color: color2,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Form(
                  key: _registerFormKey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          style: TextStyle(color: color2),
                          controller: firstNameController,
                          decoration: new InputDecoration(
                            border: new OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: color2, width: 2.0)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: color2, width: 2.0)),
                            labelText: 'First Name',
                            labelStyle: TextStyle(color: color2),
                          ),
                          validator: (value) =>
                              Validator.validateName(name: value.toString()),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          style: TextStyle(color: color2),
                          controller: lastNameController,
                          decoration: new InputDecoration(
                            border: new OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: color2, width: 2.0)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: color2, width: 2.0)),
                            labelText: 'Last Name',
                            labelStyle: TextStyle(color: color2),
                          ),
                          validator: (value) =>
                              Validator.validateName(name: value.toString()),
                        ),
                      ),
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
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          style: TextStyle(color: color2),
                          obscureText: true,
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: color2, width: 2.0)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: color2, width: 2.0)),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: color2),
                          ),
                          validator: (value) => Validator.validatePassword(
                              password: value.toString()),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          style: TextStyle(color: color2),
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: color2, width: 2.0)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: color2, width: 2.0)),
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(color: color2),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password can\'t be empty!';
                            }
                            // ignore: unrelated_type_equality_checks
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              return 'doesn\'t match above password!';
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                          height: 50,
                          width: 400,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                primary: Colors.white,
                                backgroundColor: color2,
                              ),
                              child: Text('Sign Up'),
                              onPressed: () async {
                                if (_registerFormKey.currentState!.validate()) {
                                  User? user =
                                      await FireAuth.registerUsingEmailPassword(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
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
                          Text('Allready have an account?' , style: TextStyle(color: color2
                          ),),
                          TextButton(
                            child: Text(
                              'login',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, LoginScreen.routeName);
                            },
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ))
                    ],
                  ))
            ],
          )),
    ));
  }
}
