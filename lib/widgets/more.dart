import 'package:flutter/material.dart';

class More extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
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
                      SizedBox(
                        width: 160.0,
                        height: 140.0,
                        child: Card(
                          color: Colors.grey[350],
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.checklist_rtl_sharp,
                                  color: Theme.of(context).primaryColor,
                                  size: 50.0,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Prayer Tracker",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100),
                                )
                              ],
                            ),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 160.0,
                        height: 140.0,
                        child: Card(
                          color: Colors.grey[350],
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.check_box,
                                  size: 50.0,
                                  color: Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Fast Tracker",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100),
                                )
                              ],
                            ),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 160.0,
                        height: 140.0,
                        child: Card(
                          color: Colors.grey[350],
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.search,
                                  size: 50.0,
                                  color: Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Halal Food     Search",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                /*Text(
                                  "4 Items",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100),
                                )*/
                              ],
                            ),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 160.0,
                        height: 140.0,
                        child: Card(
                          color: Colors.grey[350],
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.location_searching_rounded,
                                  size: 50.0,
                                  color: Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Local Mosque Search",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                /*Text(
                                  "6 Items",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100),
                                )*/
                              ],
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
    );
  }
}
