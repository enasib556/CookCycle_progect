import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static Future<int> getSelectedCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('selectedCount') ?? 0;
  }

  static Future<void> setSelectedCount(int count) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('selectedCount', count);
  }
}
