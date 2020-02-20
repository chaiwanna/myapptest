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

class notiList extends StatefulWidget {
  @override
  _notiListState createState() => _notiListState();
}

class _notiListState extends State<notiList> {
//  int totalRecord;
//  int pageSize;
//  int n = 5;
//  var pageNo;
//  var paging;
//  var data;
//  bool _isLoading = true;
//  bool isLoadmore = true;
//  int avg;
//  ApiProvider apiProvider = ApiProvider();
//
//  Future getnotifications() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    String token = prefs.getString('X-Auth-Token');
//
//    try {
//      var rs = await apiProvider.getnotifications(token);
//      print(rs.headers);
//
//      if (rs.statusCode == 200) {
//        var jsonRes = json.decode(rs.body);
//        if (jsonRes['result']['msg'] == 'success') {
//          setState(() {
//            _isLoading = false;
//            isLoadmore = false;
//            pageNo = jsonRes['paging']['pageNo'];
//            data = jsonRes['data'];
//            paging = jsonRes['paging']['pageNo'];
//
//            print(data);
//          });
//        } else {
//          print(jsonRes['result']['msg']);
//        }
//      }
//    } catch (error) {
//      print(error);
//    }
//  }
//
//  @override
//  void initState() {
//    setState(() {
//      getnotifications();
//      super.initState();
//    });
//  }

  @override
  Widget build(BuildContext context) {
    Widget appBar = AppBar(
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
                  'แจ้งเตือน',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ],
    );
    return Scaffold(
      body: appBar,
    );
//    final loading = new SpinKitThreeBounce(
//      color: HexColor('#bbce00'),
//      size: 20.0,
//    );
//    return Container(
//      child: _isLoading
//          ? Center(
//              child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: [loading],
//            ))
//          : ListView.builder(
//              itemCount: 5,
//              itemBuilder: (context, position) {
//                return Padding(
//                  padding:
//                      const EdgeInsets.only(left: 15.0, top: 20.0, right: 15.0),
//                  child: Container(
//                    child: Column(
//                      children: <Widget>[
//                        Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: <Widget>[
//                            Text('${data[position]['notiMsg']}',
//                                style: TextStyle(fontWeight: FontWeight.bold)),
//                          ],
//                        ),
//                        Divider(
//                          color: HexColor('#bbce00'),
//                        ),
//                      ],
//                    ),
//                  ),
//                );
//              }),
//    );
  }
}
