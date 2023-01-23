import 'package:flutter/material.dart';
import 'package:schoolclient/screens/home_screen/choosekid.dart';
import 'package:schoolclient/screens/home_screen/home-screen.dart';
import 'package:schoolclient/screens/splash-screen/splash_screen.dart';
class LoginScreen extends StatelessWidget {
 static String routeName='LoginScreen';
  @override
 Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 242, 246),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                child: Image.asset('images/login2.png'),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFEF806F),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Numéro de téléphone',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color:  Color.fromARGB(255, 255, 242, 246),
                            ),
                            child: const TextField(
                              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                hintText: 'Numéro de téléphone',
                                hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Mot de pass',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
        
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color.fromARGB(255, 255, 242, 246),
                            ),
                            child:  TextFormField(
                              obscureText: true,
                              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                              decoration: const InputDecoration(
                                labelText: 'Mot de pass',
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                hintText: 'Mot de pass',
                                hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                            
                          ),
                          const SizedBox(height: 35),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => ChooseKid()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color:  Color.fromARGB(255, 255, 242, 246),
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    ' Se connecter',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}