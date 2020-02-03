import 'package:flutter/material.dart';

class PersonalInformation extends StatefulWidget {
  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('แก้ไขข้อมูล'),
        ),
        body: ListView(children: <Widget>[
          Stack(children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'ข้อมูลส่วนตัว',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'ssss'),
                ),
                TextFormField(),
                RaisedButton(
                  color: Colors.purple,
                  onPressed: () {},
                  child: Text(
                    'บันทึก',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                )
              ],
            ),
          ])
        ]));
  }
}
