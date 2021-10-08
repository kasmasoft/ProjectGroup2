import 'package:flutter/material.dart';
import 'package:prayer_time_application/screens/more/widgets/custom_icon.dart';

class More extends StatelessWidget {
  static String routeName = "/more";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: Text(
                  "More",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20.0,
                    children: <Widget>[
                      CustomeIcon(Icons.checklist_rtl_sharp, 'Prayer Tracker'),
                      CustomeIcon(Icons.check_box, 'Fasting Tracker'),
                      CustomeIcon(Icons.search, 'Halal Food'),
                      CustomeIcon(Icons.location_searching_rounded, 'Local Mosque')
                    ],
                  ),
                ),
              )
            ],
          ),
    );
  }
}


// Icons.checklist_rtl_sharp
// Icons.check_box
// Icons.search
// Icons.location_searching_rounded