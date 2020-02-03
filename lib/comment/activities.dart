import 'package:flutter/material.dart';

class Activities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 0.0, right: 0.0),
          child: Card(
            child: Container(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/cycle.jpg',
                    width: 350.0,
                  ),
                  Text(
                    'จักรยาน',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
