import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/providers/main_model.dart';
import 'package:prayer_time_application/screens/fast_tracker/widgets/utils.dart';
import 'package:prayer_time_application/services/database_services.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List<bool>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  DatabaseReference ref = FirebaseDatabase.instance.reference();
  final FirebaseAuth auth = FirebaseAuth.instance;

  DatabaseServices dbs = DatabaseServices();

  late String userid;

  List<bool> isChecked = [false, false, false, false, false];

  @override
  void initState() {
    selectedEvents = {};
    selectedDay = _converToZeroOffset(DateTime.now());
    userid = auth.currentUser!.uid;
    super.initState();
  }

  DateTime _converToZeroOffset(DateTime dt) {
    return DateTime.parse(DateTime(dt.year, dt.month, dt.day).toString() + "Z");
  }

  List<bool> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: color2, //change your color here
        ),
        backgroundColor: color1,
        centerTitle: true,
        title: Text(
          "Prayer Tracker",
          style: TextStyle(color: color2),
        ),
      ),
      body: StreamBuilder<Event>(
          stream: ref.child("/$userid/fast_tracker/").onValue,
          builder: (context, snapshot) {
            print(snapshot);
            if (snapshot.hasData) {
              // print(snapshot.requireData.snapshot.value[
              //     "${selectedDay.day}-${selectedDay.month}-${selectedDay.year}"]);
              // snapshot.requireData.snapshot.value
              //     .cast<String, dynamic>()
              //     .forEach((dt, val) {
              //   print(_converToZeroOffset(
              //       DateTime.parse(dt.toString() + " 00:00:00.000")));
              //   if (selectedEvents[_converToZeroOffset(
              //           DateTime.parse(dt.toString() + " 00:00:00.000"))] ==
              //       null) {
              //     selectedEvents[_converToZeroOffset(
              //         DateTime.parse(dt.toString() + " 00:00:00.000"))] = [];
              //   } else {
              //     selectedEvents[_converToZeroOffset(
              //             DateTime.parse(dt.toString() + " 00:00:00.000"))]!
              //         .add(true);
              //   }
              // });
            }
            return Container(
              child: Column(
                children: [
                  TableCalendar(
                    focusedDay: selectedDay,
                    firstDay: kFirstDay,
                    lastDay: kToday,
                    calendarFormat: format,
                    onFormatChanged: (CalendarFormat _format) {
                      setState(() {
                        format = _format;
                      });
                    },
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    daysOfWeekVisible: true,

                    //Day Changed
                    onDaySelected: (DateTime selectDay, DateTime focusDay) {
                      setState(() {
                        selectedDay = selectDay;
                        focusedDay = focusDay;
                      });
                      print(DateTime(
                          focusedDay.year, focusedDay.month, focusedDay.day));
                      print(DateTime(kToday.year, kToday.month, kToday.day));
                    },
                    selectedDayPredicate: (DateTime date) {
                      return isSameDay(selectedDay, date);
                    },

                    eventLoader: _getEventsfromDay,

                    //To style the Calendar
                    calendarStyle: CalendarStyle(
                      isTodayHighlighted: true,
                      selectedDecoration: BoxDecoration(
                        color: Colors.amber.shade200,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      todayDecoration: BoxDecoration(
                        color: color2,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      defaultDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      weekendDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      outsideDaysVisible: false,
                      defaultTextStyle: TextStyle(color: color2),
                      selectedTextStyle: TextStyle(color: color2),
                      weekendTextStyle: TextStyle(color: color2),
                    ),
                    headerStyle: HeaderStyle(
                      titleTextStyle: TextStyle(color: color2),
                      formatButtonDecoration: BoxDecoration(
                          border: const Border.fromBorderSide(BorderSide()),
                          color: color2,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12.0))),
                      formatButtonTextStyle: TextStyle(color: Colors.white),
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: color2,
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: color2,
                      ),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                        decoration: BoxDecoration(
                          color: color2,
                        ),
                        dowTextFormatter: (date, locale) =>
                            DateFormat.E(locale).format(date),
                        weekdayStyle: TextStyle(color: Colors.white),
                        weekendStyle: TextStyle(color: Colors.white)),
                  ),
                  // ..._getEventsfromDay(selectedDay).map(
                  //   (Event event) => ListTile(
                  //     title: Text(
                  //       event.title,
                  //       style: TextStyle(color: color2),
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                      Card(
                        child: ListTile(
                          tileColor: color1,
                          title: Text('Fajr', style: TextStyle(color: color2, fontSize: 22),),
                          trailing: GFCheckbox(
                            size: GFSize.SMALL,
                            activeBgColor: color2,
                            onChanged: (value) {
                              setState(() {
                                isChecked[0] = value;
                              });
                            },
                            value: isChecked[0],
                            inactiveIcon: null,
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          tileColor: color1,
                          title: Text('Dhuhr', style: TextStyle(color: color2, fontSize: 22),),
                          trailing: GFCheckbox(
                            size: GFSize.SMALL,
                            activeBgColor: color2,
                            onChanged: (value) {
                              setState(() {
                                isChecked[1] = value;
                              });
                            },
                            value: isChecked[1],
                            inactiveIcon: null,
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          tileColor: color1,
                          title: Text('Asr', style: TextStyle(color: color2, fontSize: 22),),
                          trailing: GFCheckbox(
                            size: GFSize.SMALL,
                            activeBgColor: color2,
                            onChanged: (value) {
                              setState(() {
                                isChecked[2] = value;
                              });
                            },
                            value: isChecked[2],
                            inactiveIcon: null,
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          tileColor: color1,
                          title: Text('Maghrib', style: TextStyle(color: color2, fontSize: 22),),
                          trailing: GFCheckbox(
                            size: GFSize.SMALL,
                            activeBgColor: color2,
                            onChanged: (value) {
                              setState(() {
                                isChecked[3] = value;
                              });
                            },
                            value: isChecked[3],
                            inactiveIcon: null,
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          tileColor: color1,
                          title: Text('Isha', style: TextStyle(color: color2, fontSize: 22),),
                          trailing: GFCheckbox(
                            size: GFSize.SMALL,
                            activeBgColor: color2,
                            onChanged: (value) {
                              setState(() {
                                isChecked[4] = value;
                              });
                            },
                            value: isChecked[4],
                            inactiveIcon: null,
                          ),
                        ),
                      )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
