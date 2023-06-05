import 'package:flutter/material.dart';

class BottomContainer extends StatefulWidget {
  const BottomContainer({Key? key}) : super(key: key);

  @override
  _BottomContainerState createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {

  int totalPoints = 10;
  int selectedPoints = 0;
  int value_offer = 500;
  int point =200;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:RaisedButton(
        color: const Color(0xff29B6F6),
        child: const Text(
          "استخدم نقاطك",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: point > 0
            ? () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    title: Text('Replace Points'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        SizedBox(height: 16),
                        Text('Total Points: ${value_offer}'),
                        SizedBox(height: 16),
                        Slider(
                          value: selectedPoints.toDouble(),
                          min: 0,
                          max: totalPoints.toDouble(),
                          onChanged: (double value) {
                            setState(() {
                              selectedPoints = value.toInt();
                            });
                          },
                        ),
                        Text('Selected Points: $selectedPoints'),
                      ],
                    ),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            print('Selected Points: $selectedPoints');
                            print('Remaining Points: ${totalPoints - selectedPoints}');
                            value_offer = totalPoints - selectedPoints;
                          });
                          Navigator.pop(context);
                        },
                        child: Text('Confirm'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        }
            : null,
      )


    );

  }
}
