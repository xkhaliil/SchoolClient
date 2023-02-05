import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SecondPage extends StatelessWidget {
  

  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEAC7C7),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Lottie.asset("video/subject.json"),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Content goes here",
              style: Theme.of(context).textTheme.headline5,
            ),
          )
        ],
      ),
    );
  }
}