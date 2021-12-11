import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:rating_dialog/rating_dialog.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);
  static String routeName = "/settings";

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool valuefirst = true;
  bool valuesecond = false;
  bool valuetherd = false;
  bool valueFour = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: color2, //change your color here
          ),
          backgroundColor: color1,
          centerTitle: true,
          title: Text(
            "Setting",
            style: TextStyle(color: color2),
          ),
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: EdgeInsets.all(6),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: Text(
                                "Change USername",
                              ),
                              content: TextFormField(
                                onChanged: (value) {
                                  print(value);
                                },
                                decoration: InputDecoration(
                                  labelText: 'New Username',
                                  border: OutlineInputBorder(),
                                  prefixIcon:
                                      Icon(Icons.drive_file_rename_outline),
                                ),
                              ),
                              actions: <Widget>[
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'Cancel');
                                  },
                                  child: const Text('Cancel'),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'UPDATE');
                                  },
                                  child: const Text('UPDATE'),
                                ),
                              ],
                            ));
                  },
                  style: ElevatedButton.styleFrom(primary: color1),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Change Username',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: color2,
                          ),
                        ),
                        Icon(
                          Icons.person,
                          color: color2,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: Text("Change Password "),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    obscureText: true,
                                    onChanged: (value) {
                                      print(value);
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Old Password',
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(
                                          Icons.drive_file_rename_outline),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    obscureText: true,
                                    onChanged: (value) {
                                      print(value);
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'New Password',
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(
                                          Icons.drive_file_rename_outline),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    obscureText: true,
                                    onChanged: (value) {
                                      print(value);
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Confirm New Password',
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(
                                          Icons.drive_file_rename_outline),
                                    ),
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'Cancel');
                                  },
                                  child: const Text('Cancel'),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'UPDATE');
                                  },
                                  child: const Text('UPDATE'),
                                ),
                              ],
                            ));
                  },
                  style: ElevatedButton.styleFrom(primary: color1),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Change Password',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: color2,
                          ),
                        ),
                        Icon(
                          Icons.vpn_key_outlined,
                          color: color2,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text('Change Info '),
                        content: TextFormField(
                          onChanged: (value) {
                            print(value);
                          },
                          decoration: InputDecoration(
                            labelText: ' Information',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.drive_file_rename_outline),
                          ),
                        ),
                        actions: <Widget>[
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context, 'Cancel');
                            },
                            child: const Text('Cancel'),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context, 'UPDATE');
                            },
                            child: const Text('UPDATE'),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(primary: color1),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Change Email ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: color2,
                          ),
                        ),
                        Icon(
                          Icons.email,
                          color: color2,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text('Change Phone Number'),
                        content: TextFormField(
                          onChanged: (value) {
                            print(value);
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.drive_file_rename_outline),
                          ),
                        ),
                        actions: <Widget>[
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context, 'Cancel');
                            },
                            child: const Text('Cancel'),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context, 'UPDATE');
                            },
                            child: const Text('UPDATE'),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(primary: color1),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Change Phone Number ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: color2,
                          ),
                        ),
                        Icon(
                          Icons.contact_page_outlined,
                          color: color2,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: color1),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Contact Us',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: color2,
                          ),
                        ),
                        Icon(
                          Icons.message_outlined,
                          color: color2,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: color1),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'About App',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: color2,
                          ),
                        ),
                        Icon(
                          Icons.info_outline,
                          color: color2,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => RatingDialog(
                              title: Text('Rating'),
                              message: Text('Please rate our application'),
                              image: const FlutterLogo(size: 100),
                              initialRating: 4,
                              submitButtonText: 'Submit',
                              enableComment: false,
                              onCancelled: () {},
                              onSubmitted: (response) {
                                print(
                                    'rating: ${response.rating}, comment: ${response.comment}');
                              },
                            ));
                  },
                  style: ElevatedButton.styleFrom(primary: color1),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Rate Us',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: color2,
                          ),
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          color: color2,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text('Change Language '),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.greenAccent,
                                  activeColor: Colors.red,
                                  value: valuefirst,
                                  onChanged: (value) {
                                    setState(() {
                                      valuefirst = value!;
                                    });
                                  },
                                ),
                                Text("English"),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.greenAccent,
                                  activeColor: Colors.red,
                                  value: valuesecond,
                                  onChanged: (value) {
                                    setState(() {
                                      valuesecond = value!;
                                    });
                                  },
                                ),
                                Text("ARABIC"),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.greenAccent,
                                  activeColor: Colors.red,
                                  value: valuetherd,
                                  onChanged: (value) {
                                    setState(() {
                                      valuetherd = value!;
                                    });
                                  },
                                ),
                                Text("Turkish"),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.greenAccent,
                                  activeColor: Colors.red,
                                  value: valueFour,
                                  onChanged: (value) {
                                    setState(() {
                                      // valueFour !=valuefirst ?valueFour=true:valuefirst=false;
                                    });
                                  },
                                ),
                                Text("FRENCH"),
                              ],
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context, 'Cancel');
                            },
                            child: const Text('Cancel'),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context, 'UPDATE');
                            },
                            child: const Text('UPDATE'),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(primary: color1),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Change Language ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: color2,
                          ),
                        ),
                        Icon(
                          Icons.contact_page_outlined,
                          color: color2,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.WARNING,
                        headerAnimationLoop: false,
                        animType: AnimType.TOPSLIDE,
                        title: 'Warning',
                        desc: 'Are you sure you want to Signout',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          final FirebaseAuth auth = FirebaseAuth.instance;
                          auth.signOut();
                        }).show();
                  },
                  style: ElevatedButton.styleFrom(primary: color1),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Signout ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: color2,
                          ),
                        ),
                        Icon(
                          Icons.outbond_outlined,
                          color: color2,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]))));
  }
}
