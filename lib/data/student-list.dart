import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:schoolclient/model/student.dart';

class StudentSource {
  FirebaseFirestore ref = FirebaseFirestore.instance;

  List<Student> getStudentList() {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      ref
          .collection("student")
          .where("userUID", isEqualTo: currentUser.uid)
          .get()
          .then(
            (students) => print("Successfully completed ${students.toString()}"),
            onError: (e) => print("Error completing: $e"),
          );
    }

    return List.empty();
  }
}
