class Student {
  final String id;
  final String nom;
  final String prenom;
  final String userUID;

  Student(this.id, this.nom, this.prenom, this.userUID);

  @override
  String toString() => "$id, $nom, $prenom, $userUID";
}
