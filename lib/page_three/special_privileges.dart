import 'package:flutter/material.dart';

class SpecialPrivileges extends StatefulWidget {
  @override
  _SpecialPrivilegesState createState() => _SpecialPrivilegesState();
}

class _SpecialPrivilegesState extends State<SpecialPrivileges> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 20.0, right: 30.0),
            child: Card(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/pic1.jpg',
                    ),
                    Text(
                      'SF Cinema',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text('ใช้คะแนนสะสม Blue Points 2'
                        '99 คะแนน พร้อมจ่ายเงินเพียง')
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 20.0, right: 30.0),
            child: Card(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/pic1.jpg',
                    ),
                    Text(
                      'SF Cinema',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text('ใช้คะแนนสะสม Blue Points 2'
                        '99 คะแนน พร้อมจ่ายเงินเพียง')
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
