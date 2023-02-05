import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolclient/model/matiere.dart';

import 'cours_et_travauxSecondPage.dart';



class CoursePage extends StatelessWidget {
  final Matiere matiere;
  const CoursePage({super.key,  required this.matiere});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SecondPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Hero(
                        tag: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Lottie.asset("video/subject.json",
                            width: 200,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                          child: Text(
                        matiere.nom,
                        style: Theme.of(context).textTheme.headline6,
                      )),
                    ],
                  ),
                ),
              ),
    );
  }
}


























// this is the class second page when you enter you get this



