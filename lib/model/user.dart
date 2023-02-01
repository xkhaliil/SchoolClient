// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:schoolclient/model/student.dart';

class UserDetails {
  final String id;
  final String phone;
  final String nom;
  final String password;

  List<Student> students = List.empty();

  UserDetails(
      {required this.id,
      required this.phone,
      required this.nom,
      required this.password});
}
