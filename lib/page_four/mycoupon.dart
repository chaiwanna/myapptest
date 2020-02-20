import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/api_provider/Api_Provider.dart';
import 'package:my_app/colors/Colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCoupon extends StatefulWidget {
  @override
  _MyCouponState createState() => _MyCouponState();
}

class _MyCouponState extends State<MyCoupon> {
  int totalRecord;

  var pageNo;
  var paging;
  var data;
  bool _isLoading = true;
  bool isLoadmore = true;
  int avg;
  ApiProvider apiProvider = ApiProvider();

//  Future<http.Response> getCoupon() async {
//    int n = 5;
//    int pageNo = 1;
//    int i;
//    Map responseJson;
//    Map<String, String> headers = {
//      'Content-type': 'application/json',
//      'Accept': 'application/json',
//      'X-Auth-Token':
//          'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJCMTEzNTE3MDAwMDE2NDM1IiwibWVtIjoiMTM1MTcwMTcwMDE2NDM1MSIsImJnYyI6IjExMzUxNzAwMDAxNjQzNTcifQ.HzBLm18kXKnseta1Tr-2sevV0FXsPKR2_6F2GG9dbv8'
//      //
//    };
//    for (i = 1; i <= n; i++) {
//      final url = Uri(
//        scheme: 'http',
//        host: 'ocp.aspiron.co.th',
//        path: '/OCPWEB/myCoupons',
//        queryParameters: {
//          'pageSize': ['10'],
//          'pageNo': ['$pageNo'],
//          'couponStatus': ['A'],
//        },
//      );
//      print(pageNo);
//      pageNo++;
//      final getCouponreturn = await http.get(url, headers: headers);
//
//      try {
//        responseJson = json.decode(getCouponreturn.body);
//        print(getCouponreturn.statusCode);
//        if (getCouponreturn.statusCode == 200) {
//          var jsonRes = json.decode(getCouponreturn.body);
//          if (jsonRes['result']['msg'] == 'success') {
//            print(url);
//            print(responseJson);
//            setState(() {
//              _isLoading = false;
//              isLoadmore = false;
//
//              pageNo = jsonRes['paging']['pageNo'];
//              data = jsonRes['data'];
//              paging = jsonRes['paging']['pageNo'];
//              totalRecord = jsonRes['paging']['totalRecord'];
//              print(data);
//            });
//          } else {
//            print(jsonRes['result']['msg']);
//          }
//        } else {
//          print('Server error!');
//        }
//      } catch (error) {
//        print(error);
//      }
//    }
//  }

  Future getCoupon() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('X-Auth-Token');

    try {
      var rs = await apiProvider.getCoupon(token);
      print(rs.headers);

      if (rs.statusCode == 200) {
        var jsonRes = json.decode(rs.body);
        if (jsonRes['result']['msg'] == 'success') {
          setState(() {
            _isLoading = false;
            isLoadmore = false;
            pageNo = jsonRes['paging']['pageNo'];
            data = jsonRes['data'];
            paging = jsonRes['paging']['pageNo'];

            print(data);
          });
        } else {
          print(jsonRes['result']['msg']);
        }
      }
    } catch (error) {
      print(error);
    }
  }

//  final datamore = new List.generate(10, (i) => i + 1);
//  final scrollController = new ScrollController();
//  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    setState(() {
      getCoupon();
      super.initState();
//      scrollController.addListener(() {
//        if (scrollController.position.maxScrollExtent ==
//            scrollController.offset) {
//          loadMore();
//        }
//      });
    });
  }

//  @override
//  void dispose() {
//    scrollController.dispose();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    final loading = new SpinKitThreeBounce(
      color: HexColor('#bbce00'),
      size: 20.0,
    );
    return Container(
//      key: scaffoldKey,
      child: _isLoading
          ? Center(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [loading],
            ))
          : ListView.builder(
//                controller: scrollController,
              itemBuilder: (context, int position) {
//                  if (position < datamore.length) {
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, top: 10.0, right: 0.0),
                      child: InkWell(
                        onTap: () {
                          print("${data[position]['couponNameTH']}");
                        },
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Image.memory(
                                    base64.decode(
                                        data[position]['myCouponImage']),
                                    width: 350,
                                  ),
                                  Text(
                                    '${data[position]['couponNameTH']}',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor('#277cc4')),
                                  ),
                                  Text(
                                    'วันที่ได้รับ :${data[position]['activeDate']}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      'วันที่หมดอายุ :${data[position]['expireDate']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('Coupon Type :${pageNo}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 35.0, right: 35.0),
                                child: Divider(
                                  color: HexColor('#bbce00'),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
//                  }
//                  return Center(
//                    child: Opacity(
//                      opacity: isLoadmore ? 1.0 : 0.0,
//                      child: loading,
//                    ),
//                  );
              },
              itemCount: totalRecord,
            ),
//              onRefresh: () async {
//                datamore
//                  ..clear()
//                  ..addAll(await fetDataMore(1, 10));
//                setState(() {});
//              },
    );
  }

//  loadMore() async {
//    if (!isLoadmore) {
//      setState(() => isLoadmore = true);
//      if (datamore.length >= 50) {
//        await Future.delayed(Duration(seconds: 3));
//        setState(() => isLoadmore = false);
//        await makeAnimation();
//        scaffoldKey.currentState?.showSnackBar(
//          SnackBar(
//            content: Text('Get max data!'),
//          ),
//        );
//        return;
//      }
//      final newDatamore =
//          await fetDataMore(datamore.length + 1, datamore.length + 10);
//      datamore.addAll(newDatamore);
//      isLoadmore = false;
//      setState(() {});
//    }
//  }
//
//  makeAnimation() async {
//    final offsetFromBottom =
//        scrollController.position.maxScrollExtent - scrollController.offset;
//    if (offsetFromBottom < 50) {
//      await scrollController.animateTo(
//        scrollController.offset - (50 - offsetFromBottom),
//        duration: Duration(milliseconds: 500),
//        curve: Curves.easeOut,
//      );
//    }
//  }
}

//Future<List<int>> fetDataMore(int start, int end) {
//  return new Future.delayed(Duration(seconds: 5), () {
//    return new List.generate(end - start, (i) => i + start);
//  });
//}
