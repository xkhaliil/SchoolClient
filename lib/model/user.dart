// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:schoolclient/model/student.dart';

class User {
   final String id;
   final String email;
   final String nom;
    List<Student> students=List.empty();
  User({
    required this.id,
    required this.email,
    required this.nom,
     
  });

   

}
