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

class AddDocument extends StatelessWidget {
  const AddDocument({Key? key}) : super(key: key);
  static String routeName = (AddDocument).toString();

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
            "Ajouter un cours!",
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
  PlatformFile? _selectedFile;
  String? _selectedFileName;

  Future<void> _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      _selectedFile = result.files.single;
      setState(() {
        _selectedFileName = _selectedFile?.name;
      });
    }
  }

  final descriptionController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Classe? _selectedClasse;

  Matiere? _selectedMatiere;

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
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Description',
                prefixIcon: Icon(Icons.description),
                border: OutlineInputBorder(),
              ),
            ),
            _gap(),
            InkWell(
              onTap: _pickPDF,
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: _selectedFileName == null
                    ? Center(child: Text("Selectioner un fichier PDF"))
                    : Center(
                        child:
                            Text(_selectedFileName ?? "Fichier sélectionné")),
              ),
            ),
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
                    'Ajouter',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {
                  if (descriptionController.text.isNotEmpty &&
                      _selectedClasse != null &&
                      _selectedMatiere != null &&
                      _selectedFile != null) {
                    print("ajouter pressed");
                    DocumentSource()
                        .createDocument(
                            descriptionController.text,
                            _selectedClasse!.id,
                            _selectedMatiere!.id,
                            _selectedFile!)
                        .then((value) {
                      Fluttertoast.showToast(
                          msg: "le cours a été ajouté avec succès!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      cleartext();
                    }, onError: (e) {
                      print("error=$e");
                    });
                  }
                },
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
          },
          hint: Text("Selectioner une matiere", style: hintStyle),
          items: matieres
              .map((matiere) => DropdownMenuItem<Matiere>(
                  value: matiere, child: Text(" ${matiere.nom}")))
              .toList());

  void notifySelectedClassChanged() {
    MatiereSource().getMatiereListByClasse(_selectedClasse!.id).then((result) {
      setState(() {
        matieres = result;
      });
    });
  }

  void cleartext() {
    descriptionController.clear();
  }
}
