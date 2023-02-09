import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schoolclient/model/annonce.dart';
import 'package:http/http.dart' as http;

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
      //firebase messaging ; notify all users
      notifyUsers(titre, contenu);
      return value;
    }, onError: (e) {
      return Future.error(Exception("Impossible to create a News"));
    });
  }

  Future<List<Annonce>> getAnnonceList() async {
    return await db.collection(annonceCollection).get().then(
          (annonces) => annonces.docs
              .map((element) => Annonce(
                  element.id,
                  element.data()[titre],
                  element.data()[contenu],
                  (element.data()["date"] as Timestamp).toDate()))
              .toList(),
          onError: (e) => print("Error completing: $e"),
        );
  }

  Future<void> deleteAnnonce(Annonce annonce) async {
    return await db.collection(annonceCollection).doc(annonce.id).delete();
  }

  void notifyUsers(String titre, String contenu) async {
    var body = {};
    body["topic"] = "contenu";
    var data = {};
    data["title"] = titre;
    data["body"] = contenu;
    body["data"] = data;

    var response = await http.post(Uri.https("tired-jay-gilet.cyclic.app", "firebase/notification"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': '*/*'
        },
        body: jsonEncode(body));
    print(response.body);
  }
}
