import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseServices {
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  final FirebaseAuth auth = FirebaseAuth.instance;

  late Map<dynamic, dynamic> settings;

  late String userid;

  void initToggle(String userid) {
    List prayers = ['fajr', 'sunrise', 'dhuhr', 'asr', 'maghrib', 'isha'];

    // ignore: unnecessary_null_comparison
    if (ref.child("/$userid/notification_setting").key == null){
      for (var prayer in prayers) {
      var childRef =
          ref.child("/$userid/notification_setting/$prayer" + "_index/");
      childRef.set(0);
      }
    }
  }

  void addFast(int day, int month, int year) {
    var date = "$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}";
    userid = auth.currentUser!.uid;
    var childRef = ref.child("/$userid/fast_tracker/$date");
    childRef.set(true);
  }

  void removeFast(int day, int month, int year) {
    var date = "$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}";
    userid = auth.currentUser!.uid;
    var childRef = ref.child("/$userid/fast_tracker/$date");
    childRef.remove();
  }

  void addPrayer(int day, int month, int year, String prayer) {
    var date = "$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}";
    userid = auth.currentUser!.uid;
    var childRef = ref.child("/$userid/prayer_tracker/$date/$prayer");
    childRef.set(true);
  }

  void removePrayer(int day, int month, int year, String prayer) {
    var date = "$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}";
    userid = auth.currentUser!.uid;
    var childRef = ref.child("/$userid/prayer_tracker/$date/$prayer");
    childRef.remove();
  }
}
