import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:getwidget/getwidget.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);
  static String routeName = "/profile";

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? username;
  User? user;

  @override
  void initState() {
    user = auth.currentUser;
    super.initState();
  }

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
            "Profile",
            style: TextStyle(color: color2),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Card(
                  child: ListTile(
                    tileColor: color1,
                    leading: GFAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn.iconscout.com/icon/premium/png-256-thumb/muslim-boy-1420062-1201792.png"),
                      shape: GFAvatarShape.circle,
                    ),
                    title: Text(
                      "${user!.displayName}",
                      style: TextStyle(
                        color: color2,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      "${user!.email}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              backgroundColor: color1,
                              title: Text(
                                "Change Name",
                                style: TextStyle(
                                  color: color2,
                                ),
                              ),
                              content: TextFormField(
                                onChanged: (value) {
                                  print(value);
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: color2, width: 2.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: color2, width: 2.0)),
                                  labelStyle: TextStyle(color: color2),
                                  labelText: 'New Name',
                                  prefixIcon: Icon(
                                    Icons.drive_file_rename_outline,
                                    color: color2,
                                  ),
                                ),
                              ),
                              actions: <Widget>[
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'Cancel');
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(color: color2),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'UPDATE');
                                  },
                                  child: Text(
                                    'UPDATE',
                                    style: TextStyle(color: color2),
                                  ),
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
                          'Change Name',
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
                              backgroundColor: color1,
                              title: Text(
                                "Change Password ",
                                style: TextStyle(
                                  color: color2,
                                ),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    obscureText: true,
                                    onChanged: (value) {
                                      print(value);
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: color2, width: 2.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: color2, width: 2.0)),
                                      labelStyle: TextStyle(color: color2),
                                      labelText: 'Old Password',
                                      prefixIcon: Icon(
                                        Icons.drive_file_rename_outline,
                                        color: color2,
                                      ),
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
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: color2, width: 2.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: color2, width: 2.0)),
                                      labelStyle: TextStyle(color: color2),
                                      labelText: 'New Password',
                                      prefixIcon: Icon(
                                        Icons.drive_file_rename_outline,
                                        color: color2,
                                      ),
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
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: color2, width: 2.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: color2, width: 2.0)),
                                      labelStyle: TextStyle(color: color2),
                                      labelText: 'Confirm New Password',
                                      prefixIcon: Icon(
                                        Icons.drive_file_rename_outline,
                                        color: color2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'Cancel');
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(color: color2),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'UPDATE');
                                  },
                                  child: Text(
                                    'UPDATE',
                                    style: TextStyle(color: color2),
                                  ),
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
                        backgroundColor: color1,
                        title: Text(
                          'Change Email ',
                          style: TextStyle(
                            color: color2,
                          ),
                        ),
                        content: TextFormField(
                          onChanged: (value) {
                            print(value);
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: color2, width: 2.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: color2, width: 2.0)),
                            labelStyle: TextStyle(color: color2),
                            labelText: 'New Email',
                            prefixIcon: Icon(
                              Icons.drive_file_rename_outline,
                              color: color2,
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context, 'Cancel');
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: color2),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context, 'UPDATE');
                            },
                            child: Text(
                              'UPDATE',
                              style: TextStyle(color: color2),
                            ),
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
                // ElevatedButton(
                //   onPressed: () {
                //     showDialog<String>(
                //       context: context,
                //       builder: (BuildContext context) => AlertDialog(
                //         backgroundColor: color1,
                //         title: Text(
                //           'Change Phone Number',
                //           style: TextStyle(
                //             color: color2,
                //           ),
                //         ),
                //         content: TextFormField(
                //           onChanged: (value) {
                //             print(value);
                //           },
                //           keyboardType: TextInputType.number,
                //           decoration: InputDecoration(
                //             border: OutlineInputBorder(),
                //             focusedBorder: OutlineInputBorder(
                //                 borderSide:
                //                     BorderSide(color: color2, width: 2.0)),
                //             enabledBorder: OutlineInputBorder(
                //                 borderSide:
                //                     BorderSide(color: color2, width: 2.0)),
                //             labelStyle: TextStyle(color: color2),
                //             labelText: 'New Number',
                //             prefixIcon: Icon(
                //               Icons.drive_file_rename_outline,
                //               color: color2,
                //             ),
                //           ),
                //         ),
                //         actions: <Widget>[
                //           MaterialButton(
                //             onPressed: () {
                //               Navigator.pop(context, 'Cancel');
                //             },
                //             child: Text(
                //               'Cancel',
                //               style: TextStyle(color: color2),
                //             ),
                //           ),
                //           MaterialButton(
                //             onPressed: () {
                //               Navigator.pop(context, 'UPDATE');
                //             },
                //             child: Text(
                //               'UPDATE',
                //               style: TextStyle(color: color2),
                //             ),
                //           ),
                //         ],
                //       ),
                //     );
                //   },
                //   style: ElevatedButton.styleFrom(primary: color1),
                //   child: Padding(
                //     padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: <Widget>[
                //         Text(
                //           'Change Phone Number ',
                //           style: TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.w700,
                //             color: color2,
                //           ),
                //         ),
                //         Icon(
                //           Icons.contact_page_outlined,
                //           color: color2,
                //         )
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }
}
