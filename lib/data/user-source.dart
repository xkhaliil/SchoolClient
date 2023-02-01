import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schoolclient/model/user.dart';

class UserSource {
  FirebaseFirestore db = FirebaseFirestore.instance;
  static const collection = "user";
  static const userUID = "userUID";
  static const classeID = "classeID";

  Future<void> createUser(String phone, String password, String nom) async {
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
          return Future.error(Exception("Impossible to create a user"));
        });
      } else {
        Future.error(Exception("Impossible to create a user"));
      }
    });
  }

  Future<List<UserDetails>> getUsers() async =>
      await db.collection(collection).get().then(
            (response) => response.docs
                .map((element) {
                  return UserDetails(
                    id: element.id,
                    phone: element.data()["phone"],
                    nom: element["nom"],
                    password: element["password"]);
                })
                .toList(),
            onError: (e) => print("Error completing: $e"),
          );
}
