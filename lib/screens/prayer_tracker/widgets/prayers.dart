import 'package:flutter/foundation.dart';

class Prayer {
  final bool fasted;
  final DateTime date;
  Prayer({required this.fasted, required this.date});

  String toString() => this.fasted.toString();
}