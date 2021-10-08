import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prayer_time_application/screens/prayers/widgets/icon_text.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({ Key? key }) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }


  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEE, d MMM yyyy').format(currentDate);
    return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              onTap: () => _selectDate(context),
              child: iconText(
                Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                  size: 15,
                ), 
                formattedDate, 
                ''),
            ),
            // Text(formattedDate),
            // IconButton(
            //   icon: Icon(Icons.calendar_today),
            //   onPressed: () => _selectDate(context),
            // ),
          ],
        );
  }
}