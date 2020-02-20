import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

//อันแรก
class ApiProvider {
  ApiProvider();

  Map responseJson;
  Map responseUrl;
  String myrul = 'http://ocp.aspiron.co.th/OCPWEB';

  Future<http.Response> doLogin(String username, String password) async {
    String url = '$myrul/login';
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
//    1135170000164357
    var body = json.encode({"username": username, "password": password});
    final response = await http.post(url, body: body, headers: headers);
    responseJson = json.decode(response.body);
    print(responseJson.keys);
    return response;
  }

  Future<http.Response> getPoint(String token) async {
    String url = '$myrul/pointBalance/1135170000164357';
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-Auth-Token':
          'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJCMTEzNTE3MDAwMDE2NDM1IiwibWVtIjoiMTM1MTcwMTcwMDE2NDM1MSIsImJnYyI6IjExMzUxNzAwMDAxNjQzNTcifQ.HzBLm18kXKnseta1Tr-2sevV0FXsPKR2_6F2GG9dbv8'
      //
    };
    final getRes = await http.get(url, headers: headers);
    return getRes;
  }

  Future<http.Response> getPorson(String token) async {
//    js['authToken'];
    String url = '$myrul/personalInfo';
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-Auth-Token':
          'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJCMTEzNTE3MDAwMDE2NDM1IiwibWVtIjoiMTM1MTcwMTcwMDE2NDM1MSIsImJnYyI6IjExMzUxNzAwMDAxNjQzNTcifQ.HzBLm18kXKnseta1Tr-2sevV0FXsPKR2_6F2GG9dbv8'
      //
    };

    final getPorson = await http.get(
      url,
      headers: headers,
    );
    return getPorson;
  }

//หน้าคูปองของฉัน
  Future<http.Response> getCoupon(String token) async {
    int n = 4;
    int pageNo = 1;
    int i;
    var list = [];
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-Auth-Token':
          'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJCMTEzNTE3MDAwMDE2NDM1IiwibWVtIjoiMTM1MTcwMTcwMDE2NDM1MSIsImJnYyI6IjExMzUxNzAwMDAxNjQzNTcifQ.HzBLm18kXKnseta1Tr-2sevV0FXsPKR2_6F2GG9dbv8'
      //
    };
    for (i = 0; i <= n; i++) {
      final url = Uri(
        scheme: 'http',
        host: 'ocp.aspiron.co.th',
        path: '/OCPWEB/myCoupons',
        queryParameters: {
          'pageSize': ['10'],
          'pageNo': ['$pageNo'],
          'couponStatus': ['A'],
        },
      );
      print(pageNo);
      pageNo++;

      final getCouponreturn = await http.get(url, headers: headers);

      try {
        responseJson = json.decode(getCouponreturn.body);
        print(getCouponreturn.statusCode);
        if (getCouponreturn.statusCode == 200) {
          list.add(responseJson);
          print(list);
          print(url);
        } else {
          print('Server error!');
        }
      } catch (error) {
        print(error);
      }
    }
    return list[i];
  }

  //หน้าคูปองบิ้กซี
  Future<http.Response> getBigC_Coupon(String token) async {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    print(formattedDate);
//    js['authToken'];
    String url =
        '$myrul/redeemCoupons?pageSize=10&pageNo=1&effectiveDate=$formattedDate&couponOwnerType=B';
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-Auth-Token':
          'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJCMTEzNTE3MDAwMDE2NDM1IiwibWVtIjoiMTM1MTcwMTcwMDE2NDM1MSIsImJnYyI6IjExMzUxNzAwMDAxNjQzNTcifQ.HzBLm18kXKnseta1Tr-2sevV0FXsPKR2_6F2GG9dbv8'
      //
    };

    final getBigC_Coupon = await http.get(url, headers: headers);
    responseJson = json.decode(getBigC_Coupon.body);
    print(responseJson.keys);
    return getBigC_Coupon;
  }

  //หน้าคูปองบิ้กซี
  Future<http.Response> getshop_Coupon(String token) async {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    print(formattedDate);
//    js['authToken'];
    String url =
        '$myrul/redeemCoupons?pageSize=10&pageNo=1&effectiveDate=$formattedDate&couponOwnerType=O&categoryCode=';
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-Auth-Token':
          'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJCMTEzNTE3MDAwMDE2NDM1IiwibWVtIjoiMTM1MTcwMTcwMDE2NDM1MSIsImJnYyI6IjExMzUxNzAwMDAxNjQzNTcifQ.HzBLm18kXKnseta1Tr-2sevV0FXsPKR2_6F2GG9dbv8'
      //
    };

    final getshop_Coupon = await http.get(url, headers: headers);
    responseJson = json.decode(getshop_Coupon.body);
    print(responseJson.keys);
    return getshop_Coupon;
  }

  Future<http.Response> getnotifications(String token) async {
    String url = '$myrul/notiList';
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-Auth-Token':
          'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJCMTEzNTE3MDAwMDE2NDM1IiwibWVtIjoiMTM1MTcwMTcwMDE2NDM1MSIsImJnYyI6IjExMzUxNzAwMDAxNjQzNTcifQ.HzBLm18kXKnseta1Tr-2sevV0FXsPKR2_6F2GG9dbv8'
      //
    };
    final getnotifications = await http.get(url, headers: headers);
    return getnotifications;
  }
}
