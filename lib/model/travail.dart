// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Travail {
  final String id;
  final String description;
  final String ClasseID;
  Travail({
    required this.id,
    required this.description,
    required this.ClasseID,
  });

  Travail copyWith({
    String? id,
    String? description,
    String? ClasseID,
  }) {
    return Travail(
      id: id ?? this.id,
      description: description ?? this.description,
      ClasseID: ClasseID ?? this.ClasseID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'ClasseID': ClasseID,
    };
  }

  factory Travail.fromMap(Map<String, dynamic> map) {
    return Travail(
      id: map['id'] as String,
      description: map['description'] as String,
      ClasseID: map['ClasseID'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Travail.fromJson(String source) => Travail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Trvail(id: $id, description: $description, ClasseID: $ClasseID)';

  @override
  bool operator ==(covariant Travail other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.description == description &&
      other.ClasseID == ClasseID;
  }

  @override
  int get hashCode => id.hashCode ^ description.hashCode ^ ClasseID.hashCode;
}
