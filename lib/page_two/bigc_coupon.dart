import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';
import 'package:my_app/api_provider/Api_Provider.dart';
import 'package:my_app/colors/Colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BigC_CouPon extends StatefulWidget {
  @override
  _BigC_CouPonState createState() => _BigC_CouPonState();
}

class _BigC_CouPonState extends State<BigC_CouPon> {
  int totalRecord;
  bool _isLoading = true;
  var data;

  ApiProvider apiProvider = ApiProvider();
  Future getBigC_Coupon() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('authToken');

    try {
      var rs = await apiProvider.getBigC_Coupon(token);
      print(rs.statusCode);
      if (rs.statusCode == 200) {
        var jsonRes = json.decode(rs.body);
        print(jsonRes);
        if (jsonRes['result']['msg'] == 'success') {
          setState(() {
            _isLoading = false;
            data = jsonRes['data'];
            print(data);
            totalRecord = jsonRes['paging']['totalRecord'];
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
    setState(() {
      getBigC_Coupon();
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    final loading = new SpinKitThreeBounce(
      color: HexColor('#bbce00'),
      size: 20.0,
    );
    return Container(
      child: _isLoading
          ? Center(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [loading],
            ))
          : ListView.builder(
              itemCount: 5,
              itemBuilder: (context, position) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, top: 20.0, right: 15.0),
                  child: InkWell(
                    onTap: () {
                      print("Card Clicked");
                    },
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.memory(
                              base64.decode(data[position]['couponThumbnail'])),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0.0, top: 3.0, right: 0.0),
                            child: Text(
                              '${data[position]['couponNameTH']}',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor('#277cc4')),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0.0, top: 8.0, right: 0.0),
                            child: Text(
                              ' ${data[position]['responseDescTH']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: HexColor('#277cc4')),
                            ),
                          ),
                          Text(' ${data[position]['shortDescTH']}',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(' ${data[position]['tagContentTH']}',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                              'ระยะเวลา: ${data[position]['ruleStartDate']} ถึง ${data[position]['ruleEndDate']}',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                              'Redeem Rule Id : ${data[position]['redeemRuleId']}',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                              'Coupon Type :${data[position]['couponValidation']}',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
