import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolclient/data/document-source.dart';
import 'package:schoolclient/data/matiere-source.dart';
import 'package:schoolclient/data/shared_preferences.dart';
import 'package:schoolclient/model/document.dart';
import 'package:schoolclient/model/matiere.dart';

class MatierePage extends StatefulWidget {
  const MatierePage({Key? key}) : super(key: key);
  static String routeName = "MatierePage";

  @override
  State<MatierePage> createState() => _MatierePageState();
}

class _MatierePageState extends State<MatierePage> {
  Matiere? matiere;
  List<Document> documents = List.empty();

  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.getSelectedMatiereId()
        .then((matiereId) => MatiereSource().getMatiereById(matiereId))
        .then((matiere) => DocumentSource()
            .getDocumentListByClasseAndMatiere(matiere.classeID, matiere.id))
        .then((documents) {
      setState(() {
        this.documents = documents;
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFEAC7C7),
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Hero(
                  tag: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Lottie.asset("video/subject.json"),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    matiere?.nom ?? "",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Column(
                    children: documents
                        .map((doc) => ListTile(
                              title: Text(doc.description),
                              onTap: () {

                              },
                            ))
                        .toList(),
                  )
                ],
              ),
            )
          ],
        ),
      );
}
