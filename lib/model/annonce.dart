class Annonce {
  final String id;
  final String titre;
  final String contenu;
  final DateTime date;

  Annonce(this.id,this.titre, this.contenu, this.date);

  @override
  String toString() => "$id,$titre, $contenu,${date.toString()}";
}
