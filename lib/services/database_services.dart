import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseServices {
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  final FirebaseAuth auth = FirebaseAuth.instance;

  late Map<dynamic, dynamic> settings;

  late String userid;

  void initToggle(String userid) {
    List prayers = ['fajr', 'sunrise', 'dhuhr', 'asr', 'maghrib', 'isha'];

    for (var prayer in prayers) {
      var childRef =
          ref.child("/$userid/notification_setting/$prayer" + "_index/");
      childRef.set(0);
    }
  }

  void addFast(int day, int month, int year) {
    var date = "$year-$month-$day";
    userid = auth.currentUser!.uid;
    var childRef = ref.child("/$userid/fast_tracker/$date");
    childRef.set(true);
  }

  void removeFast(int day, int month, int year) {
    var date = "$year-$month-$day";
    userid = auth.currentUser!.uid;
    var childRef = ref.child("/$userid/fast_tracker/$date");
    childRef.remove();
  }
}
