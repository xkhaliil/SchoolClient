import 'package:flutter/material.dart';
import 'package:schoolclient/model/student.dart';

import '../student_screen/student-screen.dart';

class StudentTile extends StatelessWidget {
  final Student student;
  

  const StudentTile({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    final Student choosenStudent = Student(student.id, student.nom, student.prenom, student.userUID);
    return ListTile(
      leading: const Icon(
        Icons.child_care_rounded,
        size: 55,
      ),
      subtitle: const Text("student class"),
      iconColor: const Color(0xFFEAC7C7),
      tileColor: const Color(0xFFA0C3D2),
      title: Text(
        "${student.nom} ${student.prenom}",
        textScaleFactor: 1.5,
      ),
      onTap: () =>
       Navigator.pushNamed(context, StudentScreen.routeName,
          arguments: choosenStudent),
    );
  }
  
}

