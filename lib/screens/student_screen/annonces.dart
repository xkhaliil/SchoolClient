import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:schoolclient/model/annonce.dart';

class NewsFeedPage extends StatelessWidget {
  final Annonce annonce;
  const NewsFeedPage({Key? key, required this.annonce}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {

  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    clipBehavior: Clip.antiAlias,
    elevation: 4.0,
    child: Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFF222831),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          height: 150.0,
          child: Lottie.asset(
            'video/annonce.json',
            fit: BoxFit.fill,
            repeat: true,
            
          ),
        ),
        ListTile(
          tileColor: const Color(0xFF393E46),
          leading: const Icon(Icons.newspaper, color: Color(0xFFEEEEEE)),
          title:  Text("${annonce.titre}", style: const TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFEEEEEE))),
          subtitle: Text(
            '${annonce.date.day}/${annonce.date.month}/${annonce.date.year} ',
            style: const TextStyle(color: Color.fromARGB(255, 203, 203, 203)),
            
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            annonce.contenu,
            style: const TextStyle(color: Color(0xFF222831),fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
}
