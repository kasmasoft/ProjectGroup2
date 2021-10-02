// List<String> getPrayerTimes() {
//   final List<String> prayerTimeList;
//   final myCoordinates =
//       Coordinates(19.29209743677179, 72.85928629201034); // My location
//   final params = CalculationMethod.karachi.getParameters();
//   params.madhab = Madhab.hanafi;
//   final prayerTimes = PrayerTimes.today(myCoordinates, params);
//   print(
//       "---Today's Prayer Times in Your Local Timezone(${prayerTimes.fajr.timeZoneName})---");
//   print('Fajr ' + DateFormat.jm().format(prayerTimes.fajr));
//   print('Sunrise ' + DateFormat.jm().format(prayerTimes.sunrise));
//   print('Dhuhr ' + DateFormat.jm().format(prayerTimes.dhuhr));
//   print('Asr ' + DateFormat.jm().format(prayerTimes.asr));
//   print('Maghrib ' + DateFormat.jm().format(prayerTimes.maghrib));
//   print('Isha' + DateFormat.jm().format(prayerTimes.isha));

//   return prayerTimeList;
// }

// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';

final Map<String, String> prayers = {};

void getPrayerTimes() {
  final myCoordinates =
      Coordinates(19.29209743677179, 72.85928629201034); // My location
  final params = CalculationMethod.karachi.getParameters();
  params.madhab = Madhab.hanafi;
  final prayerTimes = PrayerTimes.today(myCoordinates, params);
  prayers['fajr'] = DateFormat.jm().format(prayerTimes.fajr);
  prayers['sunrise'] = DateFormat.jm().format(prayerTimes.sunrise);
  prayers['dhuhr'] = DateFormat.jm().format(prayerTimes.dhuhr);
  prayers['asr'] = DateFormat.jm().format(prayerTimes.asr);
  prayers['maghrib'] = DateFormat.jm().format(prayerTimes.maghrib);
  prayers['isha'] = DateFormat.jm().format(prayerTimes.isha);
}

