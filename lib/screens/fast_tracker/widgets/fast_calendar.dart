import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/providers/main_model.dart';
import 'package:prayer_time_application/screens/fast_tracker/widgets/utils.dart';
import 'package:prayer_time_application/services/database_services.dart';
import 'package:provider/provider.dart';
import 'fast.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List<Fast>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  DatabaseReference ref = FirebaseDatabase.instance.reference();
  final FirebaseAuth auth = FirebaseAuth.instance;

  DatabaseServices dbs = DatabaseServices();

  late String userid;

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

  List<Fast> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
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
          "Fasting Tracker",
          style: TextStyle(color: color2),
        ),
      ),
      body: StreamBuilder<Event>(
          stream: ref.child("/$userid/fast_tracker/").onValue,
          builder: (context, snapshot) {
            print(snapshot);
            if (snapshot.hasData) {
              if(snapshot.requireData.snapshot.exists){
                snapshot.requireData.snapshot.value
                  .cast<String, dynamic>()
                  .forEach((dt, val) {
                selectedEvents[_converToZeroOffset(DateTime.parse(dt.toString() +" 00:00:00.000"))] = [
                      Fast(fasted: true, date: _converToZeroOffset(DateTime.parse(dt.toString() +" 00:00:00.000")))];
              });
              }
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
                  SizedBox(
                    height: 40,
                  ),
                  Card(
                    child: ListTile(
                      title: (DateTime(selectedDay.year, selectedDay.month,
                                  selectedDay.day) ==
                              DateTime(kToday.year, kToday.month, kToday.day))
                          ? Text("Are you fasting today?",
                              style: TextStyle(
                                color: color2,
                                fontSize: 24,
                              ))
                          : Text("Did you fast on this day?",
                              style: TextStyle(
                                color: color2,
                                fontSize: 24,
                              )),
                      tileColor: color1,
                      subtitle: Consumer<MainModel>(
                        builder: (context, obj, child) {
                          return Text(
                            obj.hijrifromdate(selectedDay),
                            style: TextStyle(color: Colors.white),
                          );
                        },
                      ),
                      trailing: IconButton(
                        icon: selectedEvents[selectedDay] == null
                            ? Icon(
                                Icons.check_circle_outline_sharp,
                                color: color2,
                                size: 40,
                              )
                            : Icon(
                                Icons.close,
                                color: color2,
                                size: 40,
                              ),
                        onPressed: () {
                          if (selectedEvents[selectedDay] != null) {
                            selectedEvents.remove(selectedDay);
                            dbs.removeFast(selectedDay.day, selectedDay.month,
                                selectedDay.year);
                            print(selectedEvents);
                          } else {
                            selectedEvents[selectedDay] = [
                              Fast(
                                  fasted: true,
                                  date: selectedDay) // currently its hard coded
                            ];
                            dbs.addFast(selectedDay.day, selectedDay.month,
                                selectedDay.year);
                            print(selectedEvents);
                          }
                          
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
