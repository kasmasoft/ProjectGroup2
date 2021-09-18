import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prayer_time_application/screens/register_screen.dart';
import 'Home_screen.dart';
import '../net/flutterfire.dart';
import 'login_screen.dart';

class LoginScreen extends StatelessWidget {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
      future: _initializeFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done){
          return Container(
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
                      'Prayer Time',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: emailController,
                            decoration: new InputDecoration(
                              border: new OutlineInputBorder(),
                              labelText: 'Email',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            //forgot password screen
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).primaryColor
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                            height: 50,
                            width: 400,
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ElevatedButton(
                              child: Text('Login'),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  User? user = await FireAuth.signInUsingEmailPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    context: context,
                                  );
                                  if (user != null) {
                                    Navigator.of(context)
                                        .pushReplacement(
                                      MaterialPageRoute(builder: (context) => HomeScreen()),
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
                            Text('Don\'t have an account?'),
                            TextButton(
                              child: Text(
                                'SignUp',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context).primaryColor),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));
                              },
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ))
                      ],
                    ) 
                  ),
                ],
              )),
        );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}