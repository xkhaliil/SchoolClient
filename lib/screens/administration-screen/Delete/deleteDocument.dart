import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schoolclient/data/classe-source.dart';
import 'package:schoolclient/data/document-source.dart';
import 'package:schoolclient/data/matiere-source.dart';
import 'package:schoolclient/model/Classe.dart';
import 'package:schoolclient/model/document.dart';
import 'package:schoolclient/model/matiere.dart';

class DeleteDocument extends StatelessWidget {
  const DeleteDocument({Key? key}) : super(key: key);
  static String routeName = (DeleteDocument).toString();

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(59, 0, 0, 0),
          shadowColor: Color.fromARGB(0, 255, 193, 7),
        ),
        body: Center(
            child: isSmallScreen
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      _Logo(),
                      _FormContent(),
                    ],
                  )
                : Container(
                    padding: const EdgeInsets.all(32.0),
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Row(
                      children: const [
                        Expanded(child: _Logo()),
                        Expanded(
                          child: Center(child: _FormContent()),
                        ),
                      ],
                    ),
                  )));
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Supprimer un cours!",
            textAlign: TextAlign.center,
            style: isSmallScreen
                ? Theme.of(context).textTheme.headline5
                : Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: Colors.black),
          ),
        )
      ],
    );
  }
}

class _FormContent extends StatefulWidget {
  const _FormContent({Key? key}) : super(key: key);

  @override
  State<_FormContent> createState() => __FormContentState();
}

class __FormContentState extends State<_FormContent> {
  List<Classe> classes = List.empty();
  List<Matiere> matieres = List.empty();
  List<Document> documents = List.empty();

  final descriptionController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Classe? _selectedClasse;
  Matiere? _selectedMatiere;
  Document? _selectedDocument;
  static Classe? classeDoc;

  @override
  void initState() {
    super.initState();

    ClasseSource().getClasseList().then((result) {
      setState(() {
        classes = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 500,
                height: 50,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0)),
                child: _dropDownClasse(underline: Container())),
            _gap(),
            Container(
                width: 500,
                height: 50,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0)),
                child: _dropDownMatiere(underline: Container())),
            _gap(),
            Container(
                width: 500,
                height: 50,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0)),
                child: _dropDownDocument(underline: Container())),
            _gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Supprimer',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () { if (_selectedDocument!.id != null) {
                    DocumentSource().DeleteDocument(_selectedDocument!).then((value) {
                      Fluttertoast.showToast(
                          msg: "le documment a été supprimer avec succès!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });
                  } else {
                    Fluttertoast.showToast(
                        msg: "erreur!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);

  Widget _dropDownClasse({
    Widget? underline,
    Widget? icon,
    TextStyle? style,
    TextStyle? hintStyle,
    Color? dropdownColor,
    Color? iconEnabledColor,
  }) =>
      DropdownButton<Classe>(
          value: _selectedClasse,
          underline: underline,
          icon: icon,
          dropdownColor: dropdownColor,
          style: style,
          iconEnabledColor: iconEnabledColor,
          onChanged: (Classe? newValue) {
            setState(() {
              _selectedClasse = newValue;
              classeDoc=newValue;
            });
            notifySelectedClassChanged();
          },
          hint: Text("Select a class", style: hintStyle),
          items: classes
              .map((classe) => DropdownMenuItem<Classe>(
                  value: classe,
                  child: Text("${classe.niveau} - ${classe.nom}")))
              .toList());

  Widget _dropDownMatiere({
    Widget? underline,
    Widget? icon,
    TextStyle? style,
    TextStyle? hintStyle,
    Color? dropdownColor,
    Color? iconEnabledColor,
  }) =>
      DropdownButton<Matiere>(
          value: _selectedMatiere,
          underline: underline,
          icon: icon,
          dropdownColor: dropdownColor,
          style: style,
          iconEnabledColor: iconEnabledColor,
          onChanged: (Matiere? newValue) {
            setState(() {
              _selectedMatiere = newValue;
            });
            notifySelectedMatiereChanged();
          },
          hint: Text("Selectioner une matiere", style: hintStyle),
          items: matieres
              .map((matiere) => DropdownMenuItem<Matiere>(
                  value: matiere, child: Text(" ${matiere.nom}")))
              .toList());


              Widget _dropDownDocument({
    Widget? underline,
    Widget? icon,
    TextStyle? style,
    TextStyle? hintStyle,
    Color? dropdownColor,
    Color? iconEnabledColor,
  }) =>
      DropdownButton<Document>(
          value: _selectedDocument,
          underline: underline,
          icon: icon,
          dropdownColor: dropdownColor,
          style: style,
          iconEnabledColor: iconEnabledColor,
          onChanged: (Document? newValue) {
            setState(() {
              _selectedDocument = newValue;
            });
            notifySelectedMatiereChanged();
          },
          hint: Text("Selectioner une documment", style: hintStyle),
          items: documents
              .map((document) => DropdownMenuItem<Document>(
                  value: document, child: Text(" ${document.description}")))
              .toList());

  void notifySelectedClassChanged() {
    MatiereSource().getMatiereListByClasse(_selectedClasse!.id).then((result) {
      setState(() {
        matieres = result;
      });
    });
  }
  void notifySelectedMatiereChanged() {
  DocumentSource().getDocumentListByClasseAndMatiere(classeDoc!.id, _selectedMatiere!.id).then((result) {
      setState(() {
        documents = result;
      });
    });
}


}
