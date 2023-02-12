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

  Future<Student> getStudentById(String id) async => await db
          .collection(studentCollection)
          .doc(id)
          .get()
          .then((DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Student(
            id, data["nom"], data["prenom"], data["userUID"], data["classeID"]);
      }, onError: (e) {
        print("getClasseByStudent error");
      });

  Future<List<Student>> getStudentListByUserUID() async => await db
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

  Future<void> deleteStudent(Student student) async {
    return await db.collection(studentCollection).doc(student.id).delete();
  }

  Future<List<Student>> getStudents() async =>
      await db.collection(studentCollection).get().then(
            (students) => students.docs.map((element) {
              return Student(
                  element.id,
                  element.data()["nom"],
                  element.data()["prenom"],
                  element.data()["userUID"],
                  element.data()["classeID"]);
            }).toList(),
            onError: (e) => print("Error completing: $e"),
          );

  Future<void> updateStudent(String studentId, String newNom, String newPrenom,
      String newClassId) async {
    // Update one field,
    final data = {
      "nom": newNom,
      "prenom": newPrenom,
      "classeID": newClassId
    };
    return await db
        .collection(studentCollection)
        .doc(studentId)
        .set(data, SetOptions(merge: true));
  }
}
