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
        child: Column(
          children: <Widget>[
            
            Text("Default"),
            DottedLine(),
          
            Text("Dash length changed"),
            DottedLine(dashLength: 40),
            
            Text("Dash gap length changed"),
            DottedLine(dashLength: 30, dashGapLength: 30),
          
            Text("Line thickness changed"),
            DottedLine(
              dashLength: 30,
              dashGapLength: 30,
              lineThickness: 30,
            ),
           
            Text("Dash radius changed"),
            DottedLine(
              dashLength: 30,
              dashGapLength: 30,
              lineThickness: 30,
              dashRadius: 16,
            ),
           
            Text("Dash and dash gap color changed"),
            DottedLine(
              dashLength: 30,
              dashGapLength: 30,
              lineThickness: 30,
              dashColor: Colors.blue,
              dashGapColor: Colors.red,
            ),
           
            Text("Line direction and line length changed"),
            DottedLine(
              dashLength: 30,
              dashGapLength: 30,
              lineThickness: 30,
              dashColor: Colors.blue,
              dashGapColor: Colors.red,
              direction: Axis.vertical,
              lineLength: 150,
            ),
          
            Text("Dash gradient changed"),
            DottedLine(
              dashGradient: [
                Colors.red,
                Colors.blue,
              ],
              dashLength: 10,
              lineThickness: 30,
            ),
          
            Text("Dash gradient and dash gap gradient changed"),
            DottedLine(
              dashGradient: [
                Colors.red,
                Colors.red.withAlpha(0),
              ],
              dashGapGradient: [
                Colors.blue,
                Colors.blue.withAlpha(0),
              ],
              dashLength: 10,
              dashGapLength: 10,
              lineThickness: 30,
            ),
          
          ],
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