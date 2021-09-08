import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
 
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
                        'Prayer Time',
                        style: TextStyle(
                            color: Colors.cyan.shade300,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
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
                        focusColor: Colors.cyan.shade300,
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      //forgot password screen
                    },
                    child: Text(
                      'Forgot Password?', 
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.cyan.shade300,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: Text('Login'),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.cyan.shade300)
                      ),
                    )
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text('Don\'t have an account?'),
                        TextButton(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 15, color: Colors.cyan.shade300),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                  ))
                ],
              )),
        ));
  }
}
