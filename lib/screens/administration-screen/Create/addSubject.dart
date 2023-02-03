import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schoolclient/data/classe-source.dart';
import 'package:schoolclient/data/matiere-source.dart';
import 'package:schoolclient/model/Classe.dart';

class AddSubject extends StatelessWidget {
  const AddSubject({Key? key}) : super(key: key);
  static String routeName = "AddSubject";

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
            "Ajouter une matiere!",
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
  final matiereController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Classe? _selectedClasse;
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
            TextFormField(
              controller: matiereController,
              decoration: const InputDecoration(
                labelText: 'Matiere',
                hintText: 'Matiere',
                prefixIcon: Icon(Icons.subject),
                border: OutlineInputBorder(),
              ),
            ),
            _gap(),
            Container(
                width: 500,
                height: 50,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0)),
                child: _dropDownClasse(underline: Container())),
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
                  if ((matiereController.text != null) &&
                      (_selectedClasse?.id != null)) {
                    MatiereSource().createMatiere(
                        matiereController.text, _selectedClasse!.id);
                    Fluttertoast.showToast(
                        msg: "la matiere a été ajouté avec succès!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    cleartext();
                  } else {
                    Fluttertoast.showToast(
                        msg: "erruer!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0);
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
          },
          hint: Text("Select a class", style: hintStyle),
          items: classes
              .map((classe) => DropdownMenuItem<Classe>(
                  value: classe,
                  child: Text("${classe.niveau} - ${classe.nom}")))
              .toList());

  void cleartext() {
    matiereController.clear();
  }
}
