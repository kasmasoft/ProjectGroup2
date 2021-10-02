import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);
  static String routeName = "/profile";

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final database = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
