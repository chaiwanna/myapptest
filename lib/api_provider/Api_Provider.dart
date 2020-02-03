import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';
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
//    js['authToken'];
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
    int n = 5;
    int pageNo = 1;
    for (int i = 1; i <= n; i++) {
      print(pageNo);
      final urltest = Uri(
        scheme: 'http',
        host: 'ocp.aspiron.co.th',
        path: '/OCPWEB/myCoupons',
        queryParameters: {
          'pageSize': ['10'],
          'pageNo': ['$pageNo'],
          'couponStatus': ['A'],
        },
      );
      getUrl(urltest);
      pageNo++;
    }
//
//    final url = Uri(
//      scheme: 'http',
//      host: 'ocp.aspiron.co.th',
//      path: '/OCPWEB/myCoupons',
//      queryParameters: {
//        'pageSize': ['10'],
//        'pageNo': ['1'],
//        'couponStatus': ['A'],
//      },
//    );
//      print(j);

//      var url = '$myrul/myCoupons?pageSize=10&pageNo=$i&couponStatus=A';
//    Map<String, String> headers = {
//      'Content-type': 'application/json',
//      'Accept': 'application/json',
//      'X-Auth-Token':
//          'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJCMTEzNTE3MDAwMDE2NDM1IiwibWVtIjoiMTM1MTcwMTcwMDE2NDM1MSIsImJnYyI6IjExMzUxNzAwMDAxNjQzNTcifQ.HzBLm18kXKnseta1Tr-2sevV0FXsPKR2_6F2GG9dbv8'
//      //
//    };
//    final getCoupon = await http.get(url, headers: headers);
//    responseJson = json.decode(getCoupon.body);
//    var test = json.encode(responseJson);
//    print(test);
//    print(responseJson);
//
//    return getCoupon;
  }

  Future<http.Response> getUrl(url) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'X-Auth-Token':
          'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJCMTEzNTE3MDAwMDE2NDM1IiwibWVtIjoiMTM1MTcwMTcwMDE2NDM1MSIsImJnYyI6IjExMzUxNzAwMDAxNjQzNTcifQ.HzBLm18kXKnseta1Tr-2sevV0FXsPKR2_6F2GG9dbv8'
      //
    };

    final getMyCoupon = await http.get(url, headers: headers);
    responseJson = json.decode(getMyCoupon.body);
    var test = json.encode(responseJson);
    print(url);
    print(test);
    print(responseJson);
    return getMyCoupon;
  }

//  Future<http.Response> getToken(String token) async {
//    Map<String, String> headers = {
//      'Content-type': 'application/json',
//      'Accept': 'application/json',
//      'X-Auth-Token':
//          'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJCMTEzNTE3MDAwMDE2NDM1IiwibWVtIjoiMTM1MTcwMTcwMDE2NDM1MSIsImJnYyI6IjExMzUxNzAwMDAxNjQzNTcifQ.HzBLm18kXKnseta1Tr-2sevV0FXsPKR2_6F2GG9dbv8'
//      //
//    };
//    token = headers;
//    return getToken(token);
////    final getCoupon = await http.get(url);
////    responseJson = json.decode(getCoupon.body);
////    var test = json.encode(responseJson);
////    print(url);
////    print(test);
////    print(responseJson);
//  }

  //หน้าคูปองบิ้กซี

  Future<http.Response> getBigC_Coupon(String token) async {
//    js['authToken'];
    String url =
        '$myrul/redeemCoupons?pageSize=10&pageNo=1&effectiveDate=2020-01-31&couponOwnerType=B';
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
//
//class Job {
//  final int id;
//  final String position;
//  final String company;
//  final String description;
//
//  Job({this.id, this.position, this.company, this.description});
//
//  factory Job.fromJson(Map<String, dynamic> json) {
//    return Job(
//      id: json['id'],
//      position: json['position'],
//      company: json['company'],
//      description: json['description'],
//    );
//  }
//  Future<List<Job>> _fetchJobs() async {
//    final jobsListAPIUrl =
//        'http://ocp.aspiron.co.th/OCPWEB/myCoupons?pageSize=10&pageNo=1&couponStatus=A';
//    final response = await http.get(jobsListAPIUrl);
//
//    if (response.statusCode == 200) {
//      List jsonResponse = json.decode(response.body);
//      return jsonResponse.map((job) => new Job.fromJson(job)).toList();
//    } else {
//      throw Exception('Failed to load jobs from API');
//    }
//  }
//}
}
