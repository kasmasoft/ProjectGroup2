import 'package:adhan/adhan.dart';
import 'package:prayer_time_application/helpers/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static SharedPreferences? _pref;
  static Future<SharedPreferences?> getSharedPreference() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
    return _pref;
  }

  static Future<void> clear() async {
    (await getSharedPreference())!.clear();
  }

  static setCalculationMethod(CalculationMethod method) async {
    setCalculationMethodSync(method, await getSharedPreference());
  }

  static setMadhab(Madhab madhab) async {
    setMadhabSync(madhab, await getSharedPreference());
  }

  static Future<bool>? setMadhabSync(Madhab madhab, SharedPreferences? pref) {
    return pref?.setString("madhab", madhab.toString());
  }

  static Future<bool>? setCalculationMethodSync(
      CalculationMethod method, SharedPreferences? pref) {
    return pref?.setString("calculation_method", method.toShortString());
  }

  static Future<CalculationMethod?> getCalculationMethod() async {
    return getCalculationMethodSync(await getSharedPreference());
  }

  static Future<Madhab?> getMadhab() async {
    return getMadhabSync(await getSharedPreference());
  }

  static CalculationMethod? getCalculationMethodSync(SharedPreferences? pref) {
    String? _calculationMethod = pref!.getString("calculation_method");
    if (_calculationMethod != null)
      return enumValueFromString(_calculationMethod, CalculationMethod.values);
    return null;
  }

  static Madhab? getMadhabSync(SharedPreferences? pref) {
    String? _calMadhab = pref!.getString("madhab");
    if (_calMadhab != null) {
      if (_calMadhab == "Madhab.hanafi")
        return Madhab.hanafi;
      else
        return Madhab.shafi;
    }
  }
}
