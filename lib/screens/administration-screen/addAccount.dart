import 'package:flutter/material.dart';
import 'package:schoolclient/data/user-source.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddAccount extends StatefulWidget {
  const AddAccount({super.key});
  static String routeName = "AddAccount";

  @override
  // ignore: library_private_types_in_public_api
  _AddAccountState createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ajouter un compte'),
      ),
      body: Container(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: phoneController,
                decoration:
                    const InputDecoration(labelText: 'numéro de telephone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrez le numéro';
                  }
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'mot de passe'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrez votre mot de passe ';
                  }

                  return null;
                },
                obscureText: true,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrez le nom ';
                  }

                  return null;
                },
              ),
              OutlinedButton(
                onPressed: () {
                  UserSource()
                      .createUser(phoneController.text, passwordController.text,
                          nameController.text)
                      .then((value) => print("user created"));
                  print("test");
                  Fluttertoast.showToast(
                      msg: "Task completed!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.grey,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  
                },
                child: const Text('enregister'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
