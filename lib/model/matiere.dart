// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:schoolclient/model/classe.dart';

class Matiere {
  final String id;
  final String nom;
  final String classeID;
  Matiere({
    required this.id,
    required this.nom,
    required this.classeID,
  });

  Matiere copyWith({
    String? id,
    String? nom,
    String? classeID,
  }) {
    return Matiere(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      classeID: classeID ?? this.classeID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nom': nom,
      'classeID': classeID,
    };
  }

  factory Matiere.fromMap(Map<String, dynamic> map) {
    return Matiere(
      id: map['id'] as String,
      nom: map['nom'] as String,
      classeID: map['classeID'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Matiere.fromJson(String source) => Matiere.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Matiere(id: $id, nom: $nom, classeID: $classeID)';

  @override
  bool operator ==(covariant Matiere other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nom == nom &&
      other.classeID == classeID;
  }

  @override
  int get hashCode => id.hashCode ^ nom.hashCode ^ classeID.hashCode;
}
