import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schoolclient/model/travail.dart';

class TravailSource {
  FirebaseFirestore db = FirebaseFirestore.instance;
  static const travailCollection = "travail";

  Future<void> createTravail(String description,String titre, String classeID) async {
    db.collection(travailCollection).doc().set({
      "titre":titre,
      "description": description,
      "classeID": classeID,
    }).then((value) {
      return value;
    }, onError: (e) {
      return Future.error(Exception("erreur"));
    });
  }

  Future<List<Travail>> getTravailList() async =>
      await db.collection(travailCollection).get().then(
            (travails) => travails.docs
                .map((element) => Travail(
                    id: element.id,
                    titre:element.data()["titre"],
                    description: element.data()["description"],
                    ClasseID: element.data()["classeID"]))
                .toList(),
            onError: (e) => print("Error completing: $e"),
          );

  Future<List<Travail>> getTravailListByClasse(String classeID) async =>
      await db
          .collection(travailCollection)
          .where("classeID", isEqualTo: classeID)
          .get()
          .then(
            (travails) => travails.docs
                .map((element) => Travail(
                    id: element.id,
                     titre:element.data()["titre"],
                    description: element.data()["description"],
                    ClasseID: element.data()["classeID"]))
                .toList(),
            onError: (e) => print("Error completing: $e"),
          );
          Future<void> deleteTravail(Travail travail) async {
    return await db.collection(travailCollection).doc(travail.id).delete();
  }
}
