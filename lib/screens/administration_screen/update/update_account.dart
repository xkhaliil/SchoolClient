import 'dart:math';

import 'package:flutter/material.dart';
import 'package:schoolclient/data/parent_source.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schoolclient/model/parent.dart';

class UpdateAccount extends StatelessWidget {
  const UpdateAccount({Key? key}) : super(key: key);
  static String routeName = "UpdateAccount";

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
            "Mettre a jour un compte",
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
  bool _isPasswordVisible = false;
  bool _rememberMe = false;



  List<Parent> userdetailsList = List.empty();
 
  final nomController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  Parent? _selectedUserDetails;

  @override
  void initState() {
    super.initState();
    ParentSource().getParents().then((result) {
      setState(() {
        userdetailsList = result;
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
              controller: nomController,
              decoration: const InputDecoration(
                labelText: 'Nom',
                hintText: 'entrer le nom',
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
                    'MAJ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () async {
                  if (_selectedUserDetails!.id!=null && nomController.text!=null) {
                    await ParentSource()
                        .updateParent(_selectedUserDetails!.id,nomController.text)
                        .then((value) {
                      Fluttertoast.showToast(
                          msg: "le compte a été mettre a jour avec succès!",
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
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

  Widget _gap() => const SizedBox(height: 16);
  
  void cleartext() {
    nomController.clear();
   
    }
}
