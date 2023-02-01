import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schoolclient/model/student.dart';

class StudentSource {

  FirebaseFirestore db = FirebaseFirestore.instance;
  static const studentCollection = "student";
  static const userUID = "userUID";
  static const classeID = "classeID";
  static const nom = "nom";
  static const prenom = "prenom";

  Future<List<Student>> getStudentList() async => await db
          .collection(studentCollection)
          .where(userUID, isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get()
          .then(
        (students) => students.docs
              .map((element) => Student(element.id, element.data()[nom],
                  element[prenom], element[userUID]))
              .toList(),
        onError: (e) => print("Error completing: $e"),
      );
}
