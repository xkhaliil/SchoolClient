import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schoolclient/data/classe-source.dart';
import 'package:schoolclient/data/student-source.dart';
import 'package:schoolclient/data/parent-source.dart';
import 'package:schoolclient/model/Classe.dart';
import 'package:schoolclient/model/parent.dart';
import 'package:schoolclient/model/student.dart';

class UpdateStudent extends StatelessWidget {
  const UpdateStudent({Key? key}) : super(key: key);
  static String routeName = (UpdateStudent).toString();

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(59, 0, 0, 0),
          shadowColor: const Color.fromARGB(0, 255, 193, 7),
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
            "Mettre a jour un etudiant!",
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
  List<Parent> userdetailsList = List.empty();
  List<Student> studentList = List.empty();
  final prenomController = TextEditingController();
  final nomController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Classe? _selectedClasse;
  Student? _selectedStudent;
  Parent? _selectedUserDetails;

  @override
  void initState() {
    super.initState();
    ParentSource().getParents().then((result) {
      setState(() {
        userdetailsList = result;
      });
    });
    ClasseSource().getClasseList().then((result) {
      setState(() {
        classes = result;
      });
    });
    StudentSource().getStudents().then((result) {
      setState(() {
        studentList = result;
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
                child: _dropDownStudent(underline: Container())),
            _gap(),
            TextFormField(
              controller: nomController,
              decoration: const InputDecoration(
                labelText: 'nom',
                hintText: 'nom',
                prefixIcon: Icon(Icons.perm_identity),
                border: OutlineInputBorder(),
              ),
            ),
            _gap(),
            TextFormField(
              controller: prenomController,
              decoration: const InputDecoration(
                labelText: 'prenom',
                hintText: 'prenom',
                prefixIcon: Icon(Icons.perm_identity),
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
            Container(
                width: 500,
                height: 50,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0)),
                child: _dropDownAccount(underline: Container())),
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {
                    if (_selectedUserDetails?.id != null &&
                        _selectedClasse?.id != null &&
                        _selectedStudent?.id != null &&
                        // ignore: unnecessary_null_comparison
                        nomController.text != null &&
                        // ignore: unnecessary_null_comparison
                        prenomController.text != null) {
                      StudentSource()
                          .UpdateStudent(
                              _selectedStudent!.id,
                              nomController.text,
                              prenomController.text,
                              _selectedClasse!.id,
                              _selectedUserDetails!.id)
                          .then((value) {
                        Fluttertoast.showToast(
                            msg: "l'etudiant a été créé avec succès!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        cleartext();
                      }, onError: (e) {
                        Fluttertoast.showToast(
                            msg: "erreur!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    }
                  }),
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

  Widget _dropDownAccount({
    Widget? underline,
    Widget? icon,
    TextStyle? style,
    TextStyle? hintStyle,
    Color? dropdownColor,
    Color? iconEnabledColor,
  }) =>
      DropdownButton<Parent>(
          value: _selectedUserDetails,
          underline: underline,
          icon: icon,
          dropdownColor: dropdownColor,
          style: style,
          iconEnabledColor: iconEnabledColor,
          onChanged: (Parent? newValue) {
            setState(() {
              _selectedUserDetails = newValue;
            });
          },
          hint: Text("Select an account", style: hintStyle),
          items: userdetailsList
              .map((userdetails) => DropdownMenuItem<Parent>(
                  value: userdetails,
                  child: Text("${userdetails.phone} - ${userdetails.nom}")))
              .toList());
  Widget _dropDownStudent({
    Widget? underline,
    Widget? icon,
    TextStyle? style,
    TextStyle? hintStyle,
    Color? dropdownColor,
    Color? iconEnabledColor,
  }) =>
      DropdownButton<Student>(
          value: _selectedStudent,
          underline: underline,
          icon: icon,
          dropdownColor: dropdownColor,
          style: style,
          iconEnabledColor: iconEnabledColor,
          onChanged: (Student? newValue) {
            setState(() {
              _selectedStudent = newValue;
            });
          },
          hint: Text("Select a class", style: hintStyle),
          items: studentList
              .map((student) => DropdownMenuItem<Student>(
                  value: student,
                  child: Text("${student.nom} - ${student.prenom}")))
              .toList());
  void cleartext() {
    nomController.clear();
    prenomController.clear();
  }
}
