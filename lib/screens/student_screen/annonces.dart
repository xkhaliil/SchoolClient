import 'package:flutter/material.dart';

import 'package:schoolclient/model/annonce.dart';

class NewsFeedPage extends StatelessWidget {
  final Annonce annonce;
  const NewsFeedPage({Key? key, required this.annonce}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.label_important),
            title:  Text("${annonce.titre}"),
            subtitle: Text( 
              'Administration',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              annonce.contenu,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          
         
        ],
      ),
    );
  }
}
