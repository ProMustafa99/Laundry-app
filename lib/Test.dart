import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Container(
            child: Center(
              child: CircleAvatar(
                radius: 20,
                child: Text("M"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class Square extends StatelessWidget {
  const Square({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.blueAccent,
    );
  }
}