class Annonce {
  final String id;
  final String titre;
  final String contenu;

  Annonce(this.id,this.titre, this.contenu);

  @override
  String toString() => "$id,$titre, $contenu";
}
