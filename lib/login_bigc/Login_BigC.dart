import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app/api_provider/Api_Provider.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_app/colors/Colors.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

var error = "";

class _LoginState extends State<Login> {
  TextEditingController username =
      TextEditingController.fromValue(new TextEditingValue(
          text: '1135170000164357',
          selection: new TextSelection.collapsed(
            offset: '1135170000164357'.length,
          )));
  TextEditingController password =
      TextEditingController.fromValue(new TextEditingValue(
          text: 'password',
          selection: new TextSelection.collapsed(
            offset: 'password'.length,
          )));

  final _formKey = GlobalKey<FormState>();

  ApiProvider apiProvider = ApiProvider();
  Future doLogin() async {
    if (_formKey.currentState.validate()) {
      try {
        var rs = await apiProvider.doLogin(username.text, password.text);

        if (rs.statusCode == 200) {
          print(rs.body);
          var jsonRes = json.decode(rs.body);
          if (jsonRes['result']['msg'] == 'success') {
            String token = jsonRes['data']['authToken'];
            print(token);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('token', token);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeScreen()));
          } else {
            print(jsonRes['result']['msg']);
            error = "username or password invaliid";
          }
        } else {
          print('Server error!');
        }
      } catch (error) {
        print(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: HexColor('#bbce00'),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  width: 300.0,
                  height: 200.0,
                  image: AssetImage('assets/icon/logo.png'),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 50.0, left: 50.0, top: 10.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            // ignore: missing_return
//                            validator: (String value) {
//                              if (value.isEmpty) return 'กรุณาระบุ';
//                            },
                            controller: username,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                labelText: 'Username',
                                labelStyle: TextStyle(fontSize: 20.0),
                                filled: true,
                                fillColor: Colors.white70,
                                border: InputBorder.none),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            // ignore: missing_return
//                            validator: (String value) {
//                              if (value.isEmpty) return 'กรุณาระบุรหัสผ่าน';
//                            },

                            controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.vpn_key),
                                labelText: 'Password',
                                labelStyle: TextStyle(fontSize: 20.0),
                                filled: true,
                                fillColor: Colors.white70,
                                border: InputBorder.none),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 0.0, left: 10.0, top: 0.0),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 0.0, left: 220.0, top: 0.0),
                                  child: FlatButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Help?',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                                RaisedButton(
                                  onPressed: () => doLogin(),
                                  color: Colors.lightGreen,
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

//import 'dart:async';
//import 'dart:convert';
//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//
//class Test extends StatefulWidget {
//  @override
//  _TestState createState() => _TestState();
//}
//
//class _TestState extends State<Test> {
//  Future<String> getDate() async {
//    http.Response response = await http.get(
//        Uri.encodeFull("http://ocp.aspiron.co.th/OCPWEB/test?empCode=55"),
//        headers: {"Accetp": "application/json"});
//    print(response.body);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      body: new Center(
//          child: new RaisedButton(
//        onPressed: getDate,
//        child: Text('get data'),
//      )),
//    );
//  }
//}
