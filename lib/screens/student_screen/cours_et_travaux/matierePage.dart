import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolclient/data/document-source.dart';
import 'package:schoolclient/model/document.dart';
import 'package:schoolclient/model/matiere.dart';
import 'package:schoolclient/screens/student_list_screen/student_list.dart';

class MatierePage extends StatefulWidget {
  const MatierePage({Key? key}) : super(key: key);
  static String routeName = "MatierePage";

  @override
  State<MatierePage> createState() => _MatierePageState();
}

class _MatierePageState extends State<MatierePage> {
  List<Document> documents = List.empty();

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      Matiere matiere = Matiere.fromMap(
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>);
      DocumentSource()
          .getDocumentListByClasseAndMatiere(matiere.classeID, matiere.id)
          .then((value) {
        setState(() {
          documents = value;
        });
      });
      return Scaffold(
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
                    matiere.nom,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Column(
                    children: documents
                        .map((doc) => Card(child: Text(doc.description)))
                        .toList(),
                  )
                ],
              ),
            )
          ],
        ),
      );
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, StudentList.routeName);
      });
      return Container();
    }
  }
}
