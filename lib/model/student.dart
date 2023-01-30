class Student {
  final String id;
  final String nom;
  final String prenom;
  final String userUID;

  Student(this.id, this.nom, this.prenom, this.userUID);

  @override
  String toString() => "$id, $nom, $prenom, $userUID";

  Student.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nom = json['nom'],
        prenom = json['prenom'],
        userUID = json['userUID'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'userUID': userUID
    };
  }
}
