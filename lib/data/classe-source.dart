import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schoolclient/model/Classe.dart';

class ClasseSource {
  static FirebaseFirestore db = FirebaseFirestore.instance;
  static const classeCollection = "classe";

  static Future<void> createClasse(String nom, String niveau) async {
    db.collection(classeCollection).doc().set({
      "nom": nom,
      "niveau": niveau,
    }).then((value) {
      return value;
    }, onError: (e) {
      return Future.error(Exception("Impossible to create a class"));
    });
  }

  Future<List<Classe>> getClasseList() async =>
      await db.collection(classeCollection).get().then(
            (classes) => classes.docs
                .map((element) => Classe(
                    id: element.id,
                    nom: element.data()["nom"],
                    niveau: element.data()["niveau"]))
                .toList(),
            onError: (e) => print("Error completing: $e"),
          );

  Future<Classe> getClasseByStudent(String classeID) async => await db
          .collection(classeCollection)
          .doc(classeID)
          .get()
          .then((DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Classe(id: classeID, nom: data["nom"], niveau: data["niveau"]);
      }, onError: (e) {
        print("getClasseByStudent error");
      });
}
