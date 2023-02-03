import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:schoolclient/model/document.dart';

class DocumentSource {
  FirebaseFirestore db = FirebaseFirestore.instance;
  static const documentCollection = "document";

  Future<void> createDocument(String description, String classeID,
      String matiereID, String documentName, File selectedFile) async {
    final storageRef = FirebaseStorage.instanceFor(bucket: "gs://schoolclient.appspot.com").ref();
    var documentPath = "/documents/$documentName";
    final documentRef = storageRef.child(documentPath);

    try {
      await documentRef.putFile(selectedFile);
      db.collection(documentCollection).doc().set({
        "description": description,
        "uri": documentPath,
        "classeID": classeID,
        "matiereID": matiereID,
      }).then((value) {
        return value;
      }, onError: (e) {
        return Future.error(Exception("erreur"));
      });
    } on FirebaseException catch (e) {
      print("error=$e");
    }
  }

  Future<List<Document>> getDocumentList() async =>
      await db.collection(documentCollection).get().then(
            (documents) => documents.docs
                .map(
                  (element) => Document(
                      id: element.id,
                      description: element.data()["nom"],
                      uri: element.data()["uri"],
                      classeID: element.data()["classeID"],
                      matiereID: element.data()['matiereID']),
                )
                .toList(),
            onError: (e) => print("Error completing: $e"),
          );

  Future<List<Document>> getDocumentListByClasseAndMatiere(
          String classeID, String matiereID) async =>
      await db
          .collection(documentCollection)
          .where("classeID", isEqualTo: classeID)
          .where("matiereID", isEqualTo: matiereID)
          .get()
          .then(
            (documents) => documents.docs
                .map(
                  (element) => Document(
                      id: element.id,
                      description: element.data()["nom"],
                      uri: element.data()["uri"],
                      classeID: element.data()["classeID"],
                      matiereID: element.data()['matiereID']),
                )
                .toList(),
            onError: (e) => print("Error completing: $e"),
          );
}
