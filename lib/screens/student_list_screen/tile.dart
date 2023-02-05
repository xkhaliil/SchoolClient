
import 'package:flutter/material.dart';
import 'package:schoolclient/model/student.dart';
import '../student_screen/student_screen.dart';

class StudentTile extends StatelessWidget {
  final Student student;
  const StudentTile({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.person,
        size: 55,
      ),
      
      iconColor: const Color(0xFFEAC7C7),
      tileColor: const Color(0xFFA0C3D2),
      title: Text(
        "${student.nom} ${student.prenom}",
        textScaleFactor: 1.5,
      ),
      subtitle: Text("   "),
      onTap: () =>
       Navigator.restorablePushNamed(context, StudentScreen.routeName,
          arguments: student.toJson(),
       )
    );
  }

}

