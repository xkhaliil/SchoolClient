import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  static const studentKey = "student";
  static const matiereKey = "matiere";

  static Future<String> getSelectedStudentId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(studentKey) ?? "";
  }

  static Future<bool> putSelectedStudentId(String studentId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(studentKey, studentId);
  }

  static Future<String> getSelectedMatiereId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(matiereKey) ?? "";
  }

  static Future<bool> putSelectedMatiere(String id) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(matiereKey, id);
  }

}
