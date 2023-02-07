import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolclient/data/student-source.dart';
import 'package:schoolclient/model/student.dart';
import 'package:schoolclient/screens/student_list_screen/tile.dart';

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
      
      setState(() {
        this.studentList = studentList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF222831),
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 600.0,
                  backgroundColor: const Color(0xFF393E46),
                  floating: false,
                  pinned: true,
                  stretch: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    collapseMode: CollapseMode.parallax,
                    title: const Text("Sélectionner un élève",
                        style: TextStyle(
                          height: 0.01,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
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
                  .map((student) => StudentTile(student: student))
                  .toList(),
            )),
      ),
    );
  }
}
