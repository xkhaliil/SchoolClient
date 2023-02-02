class Student {
  final String id;
  final String nom;
  final String prenom;
  final String userUID;
  final String classeID;

  Student(this.id, this.nom, this.prenom, this.userUID, this.classeID);

  @override
  String toString() => "$id, $nom, $prenom, $userUID,$classeID";

  Student.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nom = json['nom'],
        prenom = json['prenom'],
        userUID = json['userUID'],
        classeID = json['classeID'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'userUID': userUID,
      'classeID': classeID
    };
  }
}
