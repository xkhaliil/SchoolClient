import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schoolclient/model/parent.dart';

class ParentSource {
  FirebaseFirestore db = FirebaseFirestore.instance;
  static const collection = "parent";
  static const userUID = "userUID";
  static const classeID = "classeID";

  Future<void> createParent(String phone, String password, String nom) async {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: "$phone@elite.tn", password: password)
        .then((value) {
      var uid = value.user?.uid;
      if (uid != null) {
        db.collection(collection).doc(uid).set({
          "phone": phone,
          "nom": nom,
          "password": password
        }).then((value) {
          return value;
        }, onError: (e) {
          return Future.error(Exception("Impossible to create a parent"));
        });
      } else {
        Future.error(Exception("Impossible to create a parent"));
      }
    });
  }

  Future<List<Parent>> getParents() async =>
      await db.collection(collection).get().then(
            (response) => response.docs
                .map((element) {
                  return Parent(
                    id: element.id,
                    phone: element.data()["phone"],
                    nom: element.data()["nom"],
                    password: element.data()["password"]);
                })
                .toList(),
            onError: (e) => print("Error completing: $e"),
          );
}
