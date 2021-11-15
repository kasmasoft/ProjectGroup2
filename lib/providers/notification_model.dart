import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:prayer_time_application/helpers/prayerTimes.dart';

class NotificationModel extends ChangeNotifier {
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  final FirebaseAuth auth = FirebaseAuth.instance;
  late Map<dynamic, dynamic> settings;
  String currentPrayer = getCurrentPrayer().toLowerCase();
  User? user;
  String? uid;

  NotificationModel() {
    user = auth.currentUser;
    uid = user!.uid;
    ref.child('/$uid/notification_setting/').onValue.listen((event) {
      var snapshot = event.snapshot;
      this.settings = (snapshot.value as Object?) as Map<dynamic, dynamic>;
      print(settings);
    });
  }

  void saveToggle(String prayer) {
    var childRef = ref.child("/$uid/notification_setting/$prayer/");
    childRef.set((settings[prayer] + 1) % 3);
    notifyListeners();
  }

  int getToggleIndex() {
    if (currentPrayer == 'fajr') {
      return settings['fajr_index'];
    } else if (currentPrayer == 'sunrise') {
      return settings['sunrise_index'];
    } else if (currentPrayer == 'dhuhr') {
      return settings['dhuhr_index'];
    } else if (currentPrayer == 'asr') {
      return settings['asr_index'];
    } else if (currentPrayer == 'maghrib') {
      return settings['maghrib_index'];
    } else {
      return settings['isha_index'];
    }
  }

  int get currentPrayerToggle => settings['$currentPrayer+_index'];
  int get currToggleFajr => settings['fajr_index'];
  int get currToggleSunrise => settings['sunrise_index'];
  int get currToggleDhuhr => settings['dhuhr_index'];
  int get currToggleAsr => settings['asr_index'];
  int get currToggleMaghrib => settings['maghrib_index'];
  int get currToggleIsha => settings['isha_index'];
}
