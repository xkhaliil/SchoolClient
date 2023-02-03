import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schoolclient/model/matiere.dart';

class MatiereSource {
  FirebaseFirestore db = FirebaseFirestore.instance;
  static const matiereCollection = "matiere";

  Future<void> createMatiere(String nom, String classeID) async {
    db.collection(matiereCollection).doc().set({
      "nom": nom,
      "classeID": classeID,
    }).then((value) {
      return value;
    }, onError: (e) {
      return Future.error(Exception("erreur"));
    });
  }

  Future<List<Matiere>> getMatiereList() async =>
      await db.collection(matiereCollection).get().then(
            (matieres) => matieres.docs
                .map((element) => Matiere(
                    id: element.id,
                    nom: element.data()["nom"],
                    classeID: element.data()["classeID"]))
                .toList(),
            onError: (e) => print("Error completing: $e"),
          );

  Future<List<Matiere>> getMatiereListByClasse(String classeID) async =>
      await db
          .collection(matiereCollection)
          .where("classeID", isEqualTo: classeID)
          .get()
          .then(
            (matieres) => matieres.docs
                .map((element) => Matiere(
                    id: element.id,
                    nom: element.data()["nom"],
                    classeID: element.data()["classeID"]))
                .toList(),
            onError: (e) => print("Error completing: $e"),
          );
}
