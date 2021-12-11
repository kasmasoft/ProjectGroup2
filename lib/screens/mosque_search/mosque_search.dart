import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';

class MosqueScreen extends StatefulWidget {
  static String routeName = "/mosque";

  const MosqueScreen({Key? key}) : super(key: key);

  @override
  _MosqueScreenState createState() => _MosqueScreenState();
}

class _MosqueScreenState extends State<MosqueScreen> {
  var googlePlace = GooglePlace("AIzaSyC1ZnyXBx4D1GPnQCDjw46FN_6KZohIYy8");
  var risult;

  @override
  void initState() {
    initializePlaces();
    super.initState();
  }

  initializePlaces() async {
    risult = await googlePlace.autocomplete.get("1600 Amphitheatre");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(risult.toString()),
      ),
    );
  }
}
