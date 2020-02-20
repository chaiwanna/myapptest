import 'dart:convert';
import 'dart:ui';
import 'package:my_app/api_provider/Api_Provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:my_app/page_four/mycoupon.dart';
import 'package:my_app/notifications/notiList.dart';

import 'package:my_app/colors/Colors.dart';

class Pagefour extends StatefulWidget {
  @override
  _PagefourState createState() => _PagefourState();
}

class _PagefourState extends State<Pagefour> {
  int pointPost;
  ApiProvider apiProvider = ApiProvider();
  Future getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('authToken');

    try {
      var rs = await apiProvider.getPoint(token);

      if (rs.statusCode == 200) {
        var jsonRes = json.decode(rs.body);
        if (jsonRes['result']['msg'] == 'success') {
          setState(() {
            pointPost = jsonRes['data']['pointBalance'].toInt();
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
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar = AppBar(
      title: Row(
        children: <Widget>[
          Container(
            height: 50,
            child: Image.asset(
              'assets/images/BigC.png',
              width: 40,
              height: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 60.0, top: 0, right: 0.0, bottom: 0.0),
            child: Text(
              'คูปองของฉัน',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w100),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              left: 0.0, top: 14, right: 0.0, bottom: 0.0),
          child: IconButton(
              icon: Icon(FontAwesomeIcons.bell),
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => notiList()))),
        )
      ],
    );

    return Scaffold(appBar: appBar, body: new MyCoupon());
  }
}
