import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schoolclient/model/annonce.dart';

class AnnonceSource {
  FirebaseFirestore db = FirebaseFirestore.instance;
  static const annonceCollection = "annonce";
  static const titre = "titre";
  static const contenu = "contenu";

  Future<List<Annonce>> getAnnonceList() async =>
      await db.collection(annonceCollection)
      .get()
      .then(
            (annonces) => annonces.docs
                .map((element) => Annonce(element.id, element.data()[titre],
                    element[contenu]))
                .toList(),
            onError: (e) => print("Error completing: $e"),
          );
}
