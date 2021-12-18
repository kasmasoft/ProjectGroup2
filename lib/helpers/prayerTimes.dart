// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';

final Map<String, String> prayers = {};
final myCoordinates =
    Coordinates(19.29209743677179, 72.85928629201034); // My location

PrayerTimes getTodayPrayers() {
  final params = CalculationMethod.karachi.getParameters();
  params.madhab = Madhab.hanafi;
  return PrayerTimes.today(myCoordinates, params);
}

Map<String, String> getPrayerTimes() {
  PrayerTimes prayerTimes = getTodayPrayers();
  print(prayerTimes.timeForPrayer(Prayer.dhuhr));
  print(prayerTimes.asr.difference(DateTime.now()).toString());
  prayers['fajr'] = DateFormat.jm().format(prayerTimes.fajr);
  prayers['sunrise'] = DateFormat.jm().format(prayerTimes.sunrise);
  prayers['dhuhr'] = DateFormat.jm().format(prayerTimes.dhuhr);
  prayers['asr'] = DateFormat.jm().format(prayerTimes.asr);
  prayers['maghrib'] = DateFormat.jm().format(prayerTimes.maghrib);
  prayers['isha'] = DateFormat.jm().format(prayerTimes.isha);
  return prayers;
}

String getCurrentPrayer() {
  PrayerTimes prayers = getTodayPrayers();
  return prayers.currentPrayer().toString().split('.').last;
}

String getNextPrayer() {
  PrayerTimes prayers = getTodayPrayers();
  return prayers.nextPrayer().toString().split('.').last;
}

Duration getNextPrayerCounter(nextPrayer) {
  PrayerTimes prayers = getTodayPrayers();
  if (nextPrayer == 'fajr') {
    return prayers.fajr.difference(DateTime.now());
  } else if (nextPrayer == 'dhuhr') {
    return prayers.dhuhr.difference(DateTime.now());
  } else if (nextPrayer == 'asr') {
    return prayers.asr.difference(DateTime.now());
  } else if (nextPrayer == 'maghrib') {
    return prayers.maghrib.difference(DateTime.now());
  } else if (nextPrayer == 'isha') {
    return prayers.isha.difference(DateTime.now());
  } else {
    var now = prayers.fajr;
    return DateTime(now.year, now.month, now.day + 1)
        .difference(DateTime.now());
  }
}

