// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:schoolclient/model/travail.dart';

class TravauxPage extends StatefulWidget {
  final Travail travail;
 const TravauxPage({
    Key? key,
     required this.travail,
  }) : super(key: key);

  @override
  State<TravauxPage> createState() => _TravauxPageState();
}

class _TravauxPageState extends State<TravauxPage> {
  @override
 Widget build(BuildContext context) {
  return Card(
    clipBehavior: Clip.antiAlias,
    child: Column(
      children: [
        ListTile(
          tileColor: Color(0xFF222831),
          leading: Icon(Icons.home_work,color: Color(0xFFEEEEEE),),
          title: Text(widget.travail.titre,style:TextStyle(color: Color(0xFFEEEEEE)) ,),
          subtitle: Text(
            ' ',
            style: TextStyle(color: Color(0xFFEEEEEE).withOpacity(0.6)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.travail.description,
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ),
      ],
    ),
  );
}


}
