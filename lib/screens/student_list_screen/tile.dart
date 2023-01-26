import 'package:flutter/material.dart';
import 'package:schoolclient/model/student.dart';

import '../student_screen/student-screen.dart';

class StudentTile extends StatelessWidget {
  final Student student;

  const StudentTile({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.child_care_rounded,
        size: 55,
      ),
      subtitle: Text("student class"),
      iconColor: Color(0xFFEAC7C7),
      tileColor: Color(0xFFA0C3D2),
      title: Text(
        "${student.nom} ${student.prenom}",
        textScaleFactor: 1.5,
      ),
      onTap: () => Navigator.pushNamed(context, StudentScreen.routeName, arguments: {
        'id': student.id,
      }),
    );
  }
}
