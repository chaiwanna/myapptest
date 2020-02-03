import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app/api_provider/Api_Provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBarT extends StatefulWidget {
  @override
  _AppBarTState createState() => _AppBarTState();
}

class _AppBarTState extends State<AppBar> {
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
    return Scaffold(
      body: AppBar(
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
            child: IconButton(
                icon: Icon(
                  Icons.monetization_on,
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
                icon: Icon(Icons.notifications_active), onPressed: () {}),
          )
        ],
      ),
    );
  }
}
