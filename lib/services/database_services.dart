import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseServices {
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  final FirebaseAuth auth = FirebaseAuth.instance;

  late Map<dynamic, dynamic> settings;

  Map<dynamic, dynamic> getNotificationConfig() {
    final User? user = auth.currentUser;
    String uid = user!.uid;
    ref.child('/$uid/notification_setting/').once().then((snapshot) {
      settings = (snapshot.value as Object?) as Map<dynamic, dynamic>;
      print(settings);
    });
    return settings;
  }
}
