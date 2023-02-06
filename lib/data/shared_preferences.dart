import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  final studentKey = "student";

  static Future<String> getSelectedStudentId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('studentKey') ?? "";
  }

  static Future<bool> putSelectedStudentId(String studentId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString('studentKey', studentId);
  }

}
