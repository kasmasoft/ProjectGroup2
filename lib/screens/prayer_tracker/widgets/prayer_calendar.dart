import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/screens/prayer_tracker/widgets/utils.dart';
import 'package:prayer_time_application/screens/prayer_tracker/widgets/prayers.dart';
import 'package:prayer_time_application/services/database_services.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List<Prayer>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  DatabaseReference ref = FirebaseDatabase.instance.reference();
  final FirebaseAuth auth = FirebaseAuth.instance;

  DatabaseServices dbs = DatabaseServices();

  late String userid;

  Map<String, bool> isChecked = {
    'fajr': false,
    'dhuhr': false,
    'asr': false,
    'maghrib': false,
    'isha': false
  };

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

  List<Prayer> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  void clearIsChecked() {
    isChecked = {
      'fajr': false,
      'dhuhr': false,
      'asr': false,
      'maghrib': false,
      'isha': false
    };
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
          stream: ref.child("/$userid/prayer_tracker/").onValue,
          builder: (context, snapshot) {
            print(snapshot);
            if (snapshot.hasData) {
              if (snapshot.requireData.snapshot.exists) {
                snapshot.requireData.snapshot.value
                    .cast<String, dynamic>()
                    .forEach((dt, val) {
                  DateTime zoDate = _converToZeroOffset(
                      DateTime.parse(dt.toString() + " 00:00:00.000"));
                  if (selectedEvents[zoDate] != null) {
                    selectedEvents[zoDate] = [];
                  }
                  val.cast<String, dynamic>().forEach((name, vl) {
                    if (selectedEvents[zoDate] == null) {
                      selectedEvents[zoDate] = [];
                    }
                    selectedEvents[zoDate]!.add(Prayer(name: name));
                  });
                  print(val);
                });
                print(selectedEvents);
                clearIsChecked();
                var snapData = snapshot.requireData.snapshot.value[
                    "${selectedDay.year}-${selectedDay.month.toString().padLeft(2, '0')}-${selectedDay.day.toString().padLeft(2, '0')}"];
                print(snapData);
                print("${selectedDay.year}-${selectedDay.month.toString().padLeft(2, '0')}-${selectedDay.day.toString().padLeft(2, '0')}");
                if (snapData != null) {
                  print("read me 2");
                  snapData.cast<String, dynamic>().forEach((name, vl) {
                    isChecked[name] = vl;
                  });
                }
              }
              // print(snapshot.requireData.snapshot.value[
              //     "${selectedDay.day}-${selectedDay.month}-${selectedDay.year}"]);

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
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      todayDecoration: BoxDecoration(
                        color: color2,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      defaultDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            child: ListTile(
                              tileColor: color1,
                              title: Text(
                                'Fajr',
                                style: TextStyle(color: color2, fontSize: 22),
                              ),
                              trailing: GFCheckbox(
                                size: GFSize.SMALL,
                                activeBgColor: color2,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked['fajr'] = value;
                                    if (isChecked['fajr'] == true) {
                                      dbs.addPrayer(
                                          selectedDay.day,
                                          selectedDay.month,
                                          selectedDay.year,
                                          'fajr');
                                      if (selectedEvents[selectedDay] != null) {
                                        selectedEvents[selectedDay]!
                                            .add(Prayer(name: 'fajr'));
                                        print(selectedEvents);
                                      } else {
                                        selectedEvents[selectedDay] = [
                                          Prayer(name: 'fajr')
                                        ];
                                        print(selectedEvents);
                                      }
                                    } else {
                                      dbs.removePrayer(
                                          selectedDay.day,
                                          selectedDay.month,
                                          selectedDay.year,
                                          'fajr');
                                      selectedEvents[selectedDay]!.removeLast();
                                      print(selectedEvents);
                                    }
                                  });
                                },
                                value: isChecked['fajr']!,
                                inactiveIcon: null,
                              ),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              tileColor: color1,
                              title: Text(
                                'Dhuhr',
                                style: TextStyle(color: color2, fontSize: 22),
                              ),
                              trailing: GFCheckbox(
                                size: GFSize.SMALL,
                                activeBgColor: color2,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked['dhuhr'] = value;
                                    if (isChecked['dhuhr'] == true) {
                                      dbs.addPrayer(
                                          selectedDay.day,
                                          selectedDay.month,
                                          selectedDay.year,
                                          'dhuhr');
                                      if (selectedEvents[selectedDay] != null) {
                                        selectedEvents[selectedDay]!
                                            .add(Prayer(name: 'dhuhr'));
                                        print(selectedEvents);
                                      } else {
                                        selectedEvents[selectedDay] = [
                                          Prayer(name: 'dhuhr')
                                        ];
                                        print(selectedEvents);
                                      }
                                    } else {
                                      dbs.removePrayer(
                                          selectedDay.day,
                                          selectedDay.month,
                                          selectedDay.year,
                                          'dhuhr');
                                      selectedEvents[selectedDay]!.removeLast();
                                      print(selectedEvents);
                                    }
                                  });
                                },
                                value: isChecked['dhuhr']!,
                                inactiveIcon: null,
                              ),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              tileColor: color1,
                              title: Text(
                                'Asr',
                                style: TextStyle(color: color2, fontSize: 22),
                              ),
                              trailing: GFCheckbox(
                                size: GFSize.SMALL,
                                activeBgColor: color2,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked['asr'] = value;
                                    if (isChecked['asr'] == true) {
                                      dbs.addPrayer(
                                          selectedDay.day,
                                          selectedDay.month,
                                          selectedDay.year,
                                          'asr');
                                      if (selectedEvents[selectedDay] != null) {
                                        selectedEvents[selectedDay]!
                                            .add(Prayer(name: 'asr'));
                                        print(selectedEvents);
                                      } else {
                                        selectedEvents[selectedDay] = [
                                          Prayer(name: 'asr')
                                        ];
                                        print(selectedEvents);
                                      }
                                    } else {
                                      dbs.removePrayer(
                                          selectedDay.day,
                                          selectedDay.month,
                                          selectedDay.year,
                                          'asr');
                                      selectedEvents[selectedDay]!.removeLast();
                                      print(selectedEvents);
                                    }
                                  });
                                },
                                value: isChecked['asr']!,
                                inactiveIcon: null,
                              ),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              tileColor: color1,
                              title: Text(
                                'Maghrib',
                                style: TextStyle(color: color2, fontSize: 22),
                              ),
                              trailing: GFCheckbox(
                                size: GFSize.SMALL,
                                activeBgColor: color2,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked['maghrib'] = value;
                                    if (isChecked['maghrib'] == true) {
                                      dbs.addPrayer(
                                          selectedDay.day,
                                          selectedDay.month,
                                          selectedDay.year,
                                          'maghrib');
                                      if (selectedEvents[selectedDay] != null) {
                                        selectedEvents[selectedDay]!
                                            .add(Prayer(name: 'maghrib'));
                                        print(selectedEvents);
                                      } else {
                                        selectedEvents[selectedDay] = [
                                          Prayer(name: 'maghrib')
                                        ];
                                        print(selectedEvents);
                                      }
                                    } else {
                                      dbs.removePrayer(
                                          selectedDay.day,
                                          selectedDay.month,
                                          selectedDay.year,
                                          'maghrib');
                                      selectedEvents[selectedDay]!.removeLast();
                                      print(selectedEvents);
                                    }
                                  });
                                },
                                value: isChecked['maghrib']!,
                                inactiveIcon: null,
                              ),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              tileColor: color1,
                              title: Text(
                                'Isha',
                                style: TextStyle(color: color2, fontSize: 22),
                              ),
                              trailing: GFCheckbox(
                                size: GFSize.SMALL,
                                activeBgColor: color2,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked['isha'] = value;
                                    if (isChecked['isha'] == true) {
                                      dbs.addPrayer(
                                          selectedDay.day,
                                          selectedDay.month,
                                          selectedDay.year,
                                          'isha');
                                      if (selectedEvents[selectedDay] != null) {
                                        selectedEvents[selectedDay]!
                                            .add(Prayer(name: 'isha'));
                                        print(selectedEvents);
                                      } else {
                                        selectedEvents[selectedDay] = [
                                          Prayer(name: 'isha')
                                        ];
                                        print(selectedEvents);
                                      }
                                    } else {
                                      dbs.removePrayer(
                                          selectedDay.day,
                                          selectedDay.month,
                                          selectedDay.year,
                                          'isha');
                                      selectedEvents[selectedDay]!.removeLast();
                                      print(selectedEvents);
                                    }
                                  });
                                },
                                value: isChecked['isha']!,
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
