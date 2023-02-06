import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schoolclient/model/annonce.dart';

class AnnonceSource {
  FirebaseFirestore db = FirebaseFirestore.instance;
  static const annonceCollection = "annonce";
  static const titre = "titre";
  static const contenu = "contenu";

  Future<void> createAnnonce(String titre, String contenu) async {
    db.collection(annonceCollection).doc().set({
      "titre": titre,
      "contenu": contenu,
      "date": DateTime.now(),
    }).then((value) {
      return value;
    }, onError: (e) {
      return Future.error(Exception("Impossible to create a News"));
    });
  }

  Future<List<Annonce>> getAnnonceList() async {
    return await db.collection(annonceCollection).get().then(
          (annonces) => annonces.docs
              .map((element) => Annonce(element.id, element.data()[titre],
                  element.data()[contenu], (element.data()["date"] as Timestamp).toDate()))
              .toList(),
          onError: (e) => print("Error completing: $e"),
        );
  }
}
