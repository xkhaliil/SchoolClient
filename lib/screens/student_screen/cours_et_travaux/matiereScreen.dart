import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolclient/data/document-source.dart';
import 'package:schoolclient/data/matiere-source.dart';
import 'package:schoolclient/data/shared_preferences.dart';
import 'package:schoolclient/data/travail-source.dart';
import 'package:schoolclient/model/document.dart';
import 'package:schoolclient/model/matiere.dart';
import 'package:schoolclient/model/travail.dart';
import 'package:url_launcher/url_launcher.dart';

class MatierePage extends StatefulWidget {
  const MatierePage({Key? key}) : super(key: key);
  static String routeName = "MatierePage";

  @override
  State<MatierePage> createState() => _MatierePageState();
}

class _MatierePageState extends State<MatierePage> {
  Matiere? matiere;
  List<Document> documents = List.empty();
  List<Travail> travaux = List.empty();

  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.getSelectedMatiereId()
        .then((matiereId) => MatiereSource().getMatiereById(matiereId))
        .then((matiere) {
          setState(() {
            this.matiere=matiere;
          });
          return DocumentSource()
            .getDocumentListByClasseAndMatiere(matiere.classeID, matiere.id);
        }).then((documents) {
      setState(() {
        this.documents = documents;
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
  appBar: AppBar(
    backgroundColor: Color(0xFF222831),
    title: Text("Matiere", style: TextStyle(color: Color(0xFFEEEEEE))),
    elevation: 0,
  ),
  body: SingleChildScrollView(
    child: Column(
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF222831), Color(0xFF00ADB5)],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: Center(
            child: Hero(
              tag: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const Icon(
                  Icons.file_open,
                  size: 100,
                  color: Color(0xFFEEEEEE),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                matiere?.nom ?? "",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Color(0xFF222831),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Column(
                children: documents
                    .map((doc) => ListTile(
                      tileColor: Color(0xFF393E46),
                          leading: const Icon(
                            Icons.file_download,
                            color: Color(0xFF00ADB5),
                          ),
                          title: Text(
                            doc.description,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFEEEEEE)),
                          ),
                          subtitle: const Text("Telecharger", style: TextStyle(color: Color(0xFFEEEEEE))),
                          trailing: const Icon(
                            Icons.file_present,
                            color: Color(0xFF00ADB5),
                          ),
                          onTap: () {
                            DocumentSource()
                                .getDocumentDownloadPublicURL(doc.uri)
                                .then((value) {
                              _launchUrl(value);
                            });
                          },
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);

}

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw 'Could not launch $url';
  }
    
}
