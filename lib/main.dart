import 'package:flutter/material.dart';
//import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/login_bigc/Login_BigC.dart';
import 'package:my_app/colors/Colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.grey,
        primaryColor: HexColor('#bbce00'),
      ),
      home: Login(),
    );
  }
}
