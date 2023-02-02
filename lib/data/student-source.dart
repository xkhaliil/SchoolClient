import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schoolclient/model/student.dart';

class StudentSource {
  FirebaseFirestore db = FirebaseFirestore.instance;
  static const studentCollection = "student";

  Future<void> createStudent(
      String nom, String prenom, String userUID, String classeID) async {
    db.collection(studentCollection).doc().set({
      "nom": nom,
      "prenom": prenom,
      "userUID": userUID,
      "classeID": classeID,
    }).then((value) {
      return value;
    }, onError: (e) {
      return Future.error(Exception("erreur"));
    });
  }

  Future<List<Student>> getStudentList() async => await db
      .collection(studentCollection)
      .where("userUID", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
      .get()
      .then(
        (students) => students.docs
            .map((element) => Student(
                element.id,
                element.data()["nom"],
                element.data()["prenom"],
                element.data()["userUID"],
                element.data()["classeID"]))
            .toList(),
        onError: (e) => print("Error completing: $e"),
      );
}
