import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolclient/screens/home_screen/home-screen.dart';

class ChooseKid extends StatelessWidget {
  static String routeName = 'ChooseKid';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFEAE0DA),
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 500.0,
                  backgroundColor: Color(0xFFEAC7C7),
                  floating: false,
                  pinned: true,
                  stretch: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    collapseMode: CollapseMode.parallax,
                    title: const Text("Liste des enfants",
                      style: TextStyle(
                        height: 0.01,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 19.0,
                      )),
                    background: Lottie.asset(
                      "video/sghar.json",
                    ),
                  ),
                ),
              ];
            },
            body: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.child_care_rounded,size: 55,),
                  subtitle: Text("9eme B 7"),
                  iconColor: Color(0xFFEAC7C7),
                   
                  tileColor: Color(0xFFA0C3D2),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  title: Text(
                  'Khalil Ltaief',
                  textScaleFactor: 1.5,
                ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.child_care_rounded,size: 55,),
                  subtitle: Text("9eme B 7"),
                  iconColor: Color(0xFFEAC7C7),
                  
                  tileColor: Color(0xFFA0C3D2),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  title: Text(
                  'khalil ekher',
                  textScaleFactor: 1.5,
                ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.child_care_rounded,size: 55,),
                  subtitle: Text("9eme B 7"),
                  iconColor: Color(0xFFEAC7C7),
                  
                  tileColor: Color(0xFFA0C3D2),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  title: Text(
                  'khalil mch kima lokhrin',
                  textScaleFactor: 1.5,
                ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

Widget _gap() => const SizedBox(height: 16);
