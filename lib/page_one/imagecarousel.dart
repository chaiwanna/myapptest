import 'dart:ui';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/api_provider/Api_Provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:carousel_slider/carousel_slider.dart';

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

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int totalRecord;
  int pageSize;
  int n = 5;
  var pageNo;
  var paging;
  var data;
  bool _isLoading = true;
  int avg;
  ApiProvider apiProvider = ApiProvider();
  Future getCoupon() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('authToken');
    try {
      var rs = await apiProvider.getBigC_Coupon(token);
      print(rs.statusCode);
      if (rs.statusCode == 200) {
        var jsonRes = json.decode(rs.body);
        if (jsonRes['result']['msg'] == 'success') {
          setState(() {
            _isLoading = false;
            pageNo = jsonRes['paging']['pageNo'];
            data = jsonRes['data'];
            paging = jsonRes['paging']['pageNo'];

            print(data);
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
    getCoupon();
  }

  int _current = 0;
  @override
  Widget build(BuildContext context) {
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
    return Container(
      child: imageCarousel,
    );
  }
}
