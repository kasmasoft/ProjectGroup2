import 'package:flutter/foundation.dart';

class Fast {
  final bool fasted;
  final DateTime date;
  Fast({required this.fasted, required this.date});

  String toString() => this.fasted.toString();
}
