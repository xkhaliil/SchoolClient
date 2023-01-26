import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolclient/data/student-list.dart';
import 'package:schoolclient/model/student.dart';
import 'package:schoolclient/screens/student_list_screen/tile.dart';
import 'package:schoolclient/screens/student_screen/student-screen.dart';

class StudentList extends StatefulWidget {
  static String routeName = (StudentList).toString();

  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  List<Student> studentList = List.empty();

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    StudentSource().getStudentList().then((studentList) {
      for (var student in studentList) {
        print(student.toString());
      }
      setState(() {
        this.studentList = studentList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEAE0DA),
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 500.0,
                  backgroundColor: const Color(0xFFEAC7C7),
                  floating: false,
                  pinned: true,
                  stretch: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    collapseMode: CollapseMode.parallax,
                    title: const Text("Liste des enfants",
                        style: TextStyle(
                          height: 0.01,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 19.0,
                        )),
                    background: Lottie.asset(
                      "video/sghar.json",
                    ),
                  ),
                ),
              ];
            },
            body: Column(
              children: studentList
                  .map((student) => StudentTile(
                      student: student,
                      onclick: onStudentClicked(context, student)))
                  .toList(),
            )),
      ),
    );
  }
}

onStudentClicked(BuildContext context, Student student) {
  Navigator.pushReplacementNamed(context, StudentScreen.routeName,
      arguments: {
        'id': student.id,
      });
}

Widget _gap() => const SizedBox(height: 16);
