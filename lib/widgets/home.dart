import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedDay = 0;
  List<String> _days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDay = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Container(
          height: 80.0,
          width: 80.0,
          decoration: BoxDecoration(
            color: _selectedDay == index
                ? Theme.of(context).primaryColor
                : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 25.0,
                left: 20.0,
                child: Text(
                  _days[index],
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color:  _selectedDay == index
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: [
        Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Tue, 14 sept",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "7 Safar 1443 AH",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black45,
              ),
            )
          ],
        ),
        SizedBox(height: 20.0,),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Stack(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              Positioned(
                top: 40,
                left: 75,
                child: Container(
                  height: 150,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Fajr",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Text(
                              "05:30",
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 1.2,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "AM",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "Mumbai",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20.0,),
        Container(
          height: 80,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _days.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildIcon(index);
              }),
        )
      ],
    ));
  }
}
