import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schoolclient/data/classe_source.dart';
import 'package:schoolclient/data/travail_source.dart';
import 'package:schoolclient/model/classe.dart';

class AddHomeWork extends StatelessWidget {
  const AddHomeWork({Key? key}) : super(key: key);
  static String routeName = (AddHomeWork).toString();

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
       appBar: AppBar(backgroundColor: Color.fromARGB(59, 0, 0, 0),shadowColor: Color.fromARGB(0, 255, 193, 7),),
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
            "Ajouter un travail !",
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
 

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<Classe> classes = List.empty();
  final descriptionController = TextEditingController();
  final titreController=TextEditingController();
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
            
            
            Container(
                width: 500,
                height: 50,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0)),
                child: _dropDownClasse(underline: Container())),
            _gap(),
            TextFormField(
              controller: titreController,
              decoration: const InputDecoration(
                labelText: 'titre',
                hintText: 'titre',
                prefixIcon: Icon(Icons.description),
                border: OutlineInputBorder(),
              ),
            ),
            _gap(),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Desc',
                prefixIcon: Icon(Icons.description),
                border: OutlineInputBorder(),
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
                  if (descriptionController.text.isNotEmpty) {
                   TravailSource().createTravail(
                        descriptionController.text,titreController.text, _selectedClasse!.id);
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
    descriptionController.clear();
  }






  
}
