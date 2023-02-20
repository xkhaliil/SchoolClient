import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolclient/data/shared_preferences.dart';
import 'package:schoolclient/model/student.dart';
import '../student_screen/student_screen.dart';

class StudentTile extends StatelessWidget {
  final Student student;
  const StudentTile({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: const Color(0xFF474E68),
      selectedColor: const Color(0xFF474E68),
      selectedTileColor: const Color(0xFF474E68),
      leading: Lottie.asset("video/student_icon.json"),
      title: Text(
        "${student.nom} ${student.prenom}",
        // ignore: prefer_const_constructors
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 19,
        ),
      ),
      subtitle: const Text(""),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        SharedPreferencesHelper.putSelectedStudentId(student.id);
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (_, animation, __) => StudentScreen(),
            transitionsBuilder: (_, animation, __, child) => SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
