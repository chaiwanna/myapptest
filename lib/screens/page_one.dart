import 'dart:ui';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/api_provider/Api_Provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_app/comment/bluegifts.dart';
import 'package:my_app/comment/productlist.dart';
import 'package:my_app/comment/activities.dart';
import 'package:my_app/comment/blue_points.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:my_app/colors/Colors.dart';

final List<String> imageList = [
  'assets/images/member.jpg',
  'assets/images/Rejoice.jpeg',
  'assets/images/pic1.jpg',
  'assets/images/table.jpg'
];

final List child = map<Widget>(imageList, (index, i) {
  return Container(
    margin: EdgeInsets.all(15.0),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      child: Stack(
        children: <Widget>[
          Image.asset(i, fit: BoxFit.cover, width: 1500.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                'No. $index image',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    ),
  );
}).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
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

  int _current = 0;
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
          child:
              IconButton(icon: Icon(FontAwesomeIcons.bell), onPressed: () {}),
        )
      ],
    );
    Widget imageCarousel = new Column(
      children: [
        CarouselSlider(
          items: child,
          autoPlay: true,
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          enlargeCenterPage: true,
          aspectRatio: 2.0,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(imageList, (index, i) {
            return Container(
              width: 20.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: _current == index
                    ? Colors.purple
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
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
//                          CustomScrollView(
//                            slivers: <Widget>[
//                              SliverAppBar(
//                                pinned: true,
//                                expandedHeight: 256.0,
//                                flexibleSpace: FlexibleSpaceBar(
//                                  title: imageCarousel
//                                ),
//                              )
//                            ],
//                          ),
                          Container(
                            color: HexColor('#bbce00'),
                            child: imageCarousel,
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
