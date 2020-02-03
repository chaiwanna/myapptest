import 'package:flutter/material.dart';

class BluePoints extends StatefulWidget {
  @override
  _BluePointsState createState() => _BluePointsState();
}

class _BluePointsState extends State<BluePoints> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: Container(
              height: 207.7,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/member.jpg',
                    width: 350.0,
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 28.0, top: 0.0, right: 0.0),
              child: Card(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/member.jpg',
                        width: 160.0,
                      ),
                      Text('Donate Points           >>',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.green))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 0.0, right: 0.0),
              child: Card(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/member.jpg',
                        width: 160.0,
                      ),
                      Text(
                        'Promotions                >>',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 28.0, top: 10.0, right: 0.0),
              child: Card(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/member.jpg',
                        width: 160.0,
                      ),
                      Text(
                        'Activities                   >>',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 0.0),
              child: Card(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/member.jpg',
                        width: 160.0,
                      ),
                      Text(
                        'Privileges                   >>',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, top: 20.0, right: 0.0),
          child: Card(
            child: Container(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/testcard.png',
                    width: 350.0,
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
