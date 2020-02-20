import 'dart:convert';
import 'dart:ui';
import 'package:my_app/api_provider/Api_Provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:my_app/page_three/special_privileges.dart';
import 'package:my_app/page_three/shop_coupon.dart';
import 'package:my_app/notifications/notiList.dart';

class Pagethree extends StatefulWidget {
  @override
  _PagethreeState createState() => _PagethreeState();
}

class _PagethreeState extends State<Pagethree> {
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
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              left: 0.0, top: 14, right: 0.0, bottom: 0.0),
          child: IconButton(
              icon: Icon(
                FontAwesomeIcons.copyright,
              ),
              onPressed: () {}),
        ),
        Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 0.0, top: 22, right: 10.0, bottom: 0.0),
                child: Text(
                  '$pointPost',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 0.0, top: 12, right: 0.0, bottom: 0.0),
          child: Text(
            '|',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w100),
          ),
        ),
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

    return Scaffold(
      appBar: appBar,
      body: Shop_Coupon(),
    );
  }
}
