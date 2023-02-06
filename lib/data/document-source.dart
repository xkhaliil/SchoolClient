import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:schoolclient/model/document.dart';

class DocumentSource {
  FirebaseFirestore db = FirebaseFirestore.instance;
  static const documentCollection = "document";

  Future<void> createDocument(String description, String classeID,
      String matiereID, PlatformFile selectedFile) async {
    final storageRef = FirebaseStorage.instance.ref();
    var documentPath = "documents/${selectedFile.name}";
    final documentRef = storageRef.child(documentPath);

    try {
      print("uploading file = ${selectedFile.name}");
      await documentRef.putData(selectedFile.bytes!);
      print("uploading file done");
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
            (documents) {
              return documents.docs
                .map(
                  (element) {
                    print("document : ${element.data()}");
                    print("document ID : ${element.id}");
                    return Document(
                      id: element.id,
                      description: element.data()["description"],
                      uri: element.data()["uri"],
                      classeID: element.data()["classeID"],
                      matiereID: element.data()["matiereID"]);
                  },
                )
                .toList();
            },
            onError: (e) => print("Error completing: $e"),
          );

  Future<String> getDocumentDownloadPublicURL(String uri) async {
    final storageRef = FirebaseStorage.instance.ref();
    final documentRef = storageRef.child(uri);
    return documentRef.getDownloadURL();
  }

}
