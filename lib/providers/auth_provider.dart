import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isAuthenticated = false;
  User? user;
  String? uid;

  AuthProvider() {
    try {
      user = auth.currentUser;
      isAuthenticated = user == null ? false : true;
      uid = user!.uid;
    } catch (e) {
      print(e);
    }
  }

  bool get isCurrUserAuthenticated => isAuthenticated;

  void logoutCurrUser() {
    auth.signOut();
    isAuthenticated = false;
    notifyListeners();
  }
}
