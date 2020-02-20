import 'dart:ui';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/api_provider/Api_Provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_app/notifications/notiList.dart';
import 'package:my_app/page_one/imagecarousel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_app/comment/bluegifts.dart';
import 'package:my_app/comment/productlist.dart';
import 'package:my_app/comment/activities.dart';
import 'package:my_app/comment/blue_points.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:my_app/colors/Colors.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  int pointPost;
  int totalRecord;
  int pageSize;
  int n = 5;
  var pageNo;
  var paging;
  var data;
  bool _isLoading = true;
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
      title: Container(
        height: 50,
        child: Image.asset(
          'assets/images/BigC.png',
          width: 40,
          height: 40,
        ),
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
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => notiList()));
              }),
        )
      ],
    );
    return Scaffold(
        appBar: appBar,
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: HexColor('#bbce00'),
                            child: ImageCarousel(),
                          ),
                          Row(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: new Text(
                                  '  Just for you',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: new Text(
                                  'สิทธิพิเศษ',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          ProductList(),
                          Row(
                            children: <Widget>[
                              new Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: new Text(
                                    'Blue Gifts',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  )),
                            ],
                          ),
                          BlueGifts(),
                          Container(
                            color: HexColor('#bbce00'),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    new Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: new Text(
                                        'ACTIVITIES',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.0),
                                      ),
                                    ),
                                  ],
                                ),
                                Activities(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 0.0,
                                        top: 0.0,
                                        right: 20.0,
                                      ),
                                      child: FlatButton(
                                          onPressed: () {},
                                          child: Text(
                                            'ดูทั้งหมด>>',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0),
                                          )),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    new Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: new Text(
                                        'TRANSFER POINTS',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.0),
                                      ),
                                    ),
                                  ],
                                ),
                                BluePoints(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
