// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Classe {
  final String id;
  final String nom;
  final String niveau;
  Classe({
    required this.id,
    required this.nom,
    required this.niveau,
  });

  Classe copyWith({
    String? id,
    String? nom,
    String? niveau,
  }) {
    return Classe(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      niveau: niveau ?? this.niveau,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nom': nom,
      'niveau': niveau,
    };
  }

  factory Classe.fromMap(Map<String, dynamic> map) {
    return Classe(
      id: map['id'] as String,
      nom: map['nom'] as String,
      niveau: map['niveau'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Classe.fromJson(String source) => Classe.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Classe(id: $id, nom: $nom, niveau: $niveau)';

  @override
  bool operator ==(covariant Classe other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nom == nom &&
      other.niveau == niveau;
  }

  @override
  int get hashCode => id.hashCode ^ nom.hashCode ^ niveau.hashCode;
}
