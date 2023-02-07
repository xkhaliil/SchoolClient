// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Travail {
  final String id;
  final String description;
  final String titre;
  final String ClasseID;
  Travail({
    required this.id,
    required this.description,
    required this.titre,
    required this.ClasseID,
  });
  
  

  Travail copyWith({
    String? id,
    String? description,
    String? titre,
    String? ClasseID,
  }) {
    return Travail(
      id: id ?? this.id,
      description: description ?? this.description,
      titre: titre ?? this.titre,
      ClasseID: ClasseID ?? this.ClasseID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'titre': titre,
      'ClasseID': ClasseID,
    };
  }

  factory Travail.fromMap(Map<String, dynamic> map) {
    return Travail(
      id: map['id'] as String,
      description: map['description'] as String,
      titre: map['titre'] as String,
      ClasseID: map['ClasseID'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Travail.fromJson(String source) => Travail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Travail(id: $id, description: $description, titre: $titre, ClasseID: $ClasseID)';
  }

  @override
  bool operator ==(covariant Travail other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.description == description &&
      other.titre == titre &&
      other.ClasseID == ClasseID;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      description.hashCode ^
      titre.hashCode ^
      ClasseID.hashCode;
  }
}
