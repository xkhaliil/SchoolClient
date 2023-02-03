// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Document {
  final String id;
  final String description;
  final String uri;
  final String classeID;
  final String matiereID;
  Document({
    required this.id,
    required this.description,
    required this.uri,
    required this.classeID,
    required this.matiereID,
  });
  

  Document copyWith({
    String? id,
    String? description,
    String? uri,
    String? classeID,
    String? matiereID,
  }) {
    return Document(
      id: id ?? this.id,
      description: description ?? this.description,
      uri: uri ?? this.uri,
      classeID: classeID ?? this.classeID,
      matiereID: matiereID ?? this.matiereID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'uri': uri,
      'classeID': classeID,
      'matiereID': matiereID,
    };
  }

  factory Document.fromMap(Map<String, dynamic> map) {
    return Document(
      id: map['id'] as String,
      description: map['description'] as String,
      uri: map['uri'] as String,
      classeID: map['classeID'] as String,
      matiereID: map['matiereID'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Document.fromJson(String source) => Document.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Document(id: $id, description: $description, uri: $uri, classeID: $classeID, matiereID: $matiereID)';
  }

  @override
  bool operator ==(covariant Document other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.description == description &&
      other.uri == uri &&
      other.classeID == classeID &&
      other.matiereID == matiereID;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      description.hashCode ^
      uri.hashCode ^
      classeID.hashCode ^
      matiereID.hashCode;
  }
}
