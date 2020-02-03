import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/api_provider/Api_Provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeTest extends StatefulWidget {
  @override
  _HomeTestState createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  String tName;
  String tLastName;
  String bigcard;
  String mobilePhone;
  ApiProvider apiProvider = ApiProvider();
  Future getPerson() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('authToken');
    try {
      var rs = await apiProvider.getPorson(token);
      if (rs.statusCode == 200) {
        var jsonRes = json.decode(rs.body);
        if (jsonRes['result']['msg'] == 'success') {
          setState(() {
            tName = jsonRes['data']['tName'].toString();
            tLastName = jsonRes['data']['tLastName'].toString();
            bigcard = jsonRes['data']['bigcard'].toString();
            mobilePhone = jsonRes['data']['mobilePhone'].toString();
          });
        } else {
          print(jsonRes['result']['msg']);
        }
      } else {
        print('Server error!');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();
    getPerson();
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar = AppBar(
      title: Container(
        height: 50,
        child: Card(
          child: Image.asset(
            'assets/images/BigC.png',
            width: 40,
            height: 40,
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              left: 0.0, top: 14, right: 0.0, bottom: 0.0),
        ),
        Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 0.0, top: 22, right: 10.0, bottom: 0.0),
                child: Text(
                  'ข้อมูลส่วยนตัว',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
//        Padding(
//          padding: const EdgeInsets.only(
//              left: 0.0, top: 12, right: 0.0, bottom: 0.0),
//          child: Text(
//            '|',
//            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w100),
//          ),
//        ),
//        Padding(
//          padding: const EdgeInsets.only(
//              left: 0.0, top: 14, right: 0.0, bottom: 0.0),
//          child: IconButton(
//              icon: Icon(Icons.notifications_active), onPressed: () {}),
//        )
      ],
    );
//    var user = users[data];
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('$tName'),
                      Text('$tLastName'),
                    ],
                  ),
                  Text('$bigcard'),
                  Text('$mobilePhone'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
