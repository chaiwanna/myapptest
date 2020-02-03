import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/api_provider/Api_Provider.dart';
import 'package:my_app/colors/Colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_app/login_bigc/Login_BigC.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/page_five/personal_information.dart';
import 'package:my_app/colors/Colors.dart';

class Pagefive extends StatefulWidget {
  @override
  _PagefiveState createState() => _PagefiveState();
}

class _PagefiveState extends State<Pagefive> {
  String tName;
  String tLastName;
  String bigcard;
  String mobilePhone;
  ApiProvider apiProvider = ApiProvider();
  Future getPerson() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('authToken');
    try {
      var rs = await apiProvider.getPorson(token);
      if (rs.statusCode == 200) {
        var jsonRes = json.decode(rs.body);
        if (jsonRes['result']['msg'] == 'success') {
          setState(() {
            tName = jsonRes['data']['tName'].toString();
            tLastName = jsonRes['data']['tLastName'].toString();
            bigcard = jsonRes['data']['bigcard'].toString();
            mobilePhone = jsonRes['data']['mobilePhone'].toString();
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

    getPerson();
  }

  var isSelected1 = [false, true];
  var isSelected2 = [false, true];

  @override
  Widget build(BuildContext context) {
    Widget appBar = AppBar(
      title: Container(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('การตั้งค่า'),
        ),
      ),
    );
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar,
        body: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/oh.jpg'),
              ),
              accountName: Text(
                '$tName $tLastName',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text('หมายเลขสมาชิกบิ๊กการ์ : $bigcard'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PersonalInformation())),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.user,
                            size: 40.0,
                            color: HexColor('#bbce00'),
                          ),
                          Text(
                            'ข้อมูลส่วนตัว',
                            style: TextStyle(color: HexColor('#bbce00')),
                          )
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Column(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.clock,
                              size: 40.0, color: HexColor('#bbce00')),
                          Text('ประวัติการใช้บัตร',
                              style: TextStyle(color: HexColor('#bbce00')))
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Column(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.heart,
                              size: 40.0, color: HexColor('#bbce00')),
                          Text('รายการโปรด',
                              style: TextStyle(color: HexColor('#bbce00')))
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'ตั้งค่า',
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 30,
                        child: Text(
                          'เปลี่ยนเบอร์โทรศัพท์',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),

//                      FlatButton(
//                          onPressed: () {},
//                          child: Row(
//                            children: <Widget>[Text('เปลี่ยนเบอร์โทรศัพ')],
//                          )),
                    Divider(
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 30,
                        child: Text(
                          'เปลี่ยนรหัสผ่าน',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
//                    ListTile(
//                      title: Text('เปลี่ยนรหัสผ่าน'),
//                      onLongPress: () {},
//                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 30,
                            child: Text(
                              'ภาษา',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          ToggleButtons(
                            borderColor: HexColor('bbce00'),
                            fillColor: HexColor('bbce00'),
                            borderWidth: 1,
                            selectedBorderColor: HexColor('bbce00'),
                            selectedColor: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'TH',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'EN',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                            onPressed: (int index) {
                              setState(() {
                                for (int buttonIndex = 0;
                                    buttonIndex < isSelected1.length;
                                    buttonIndex++) {
                                  if (buttonIndex == index) {
                                    isSelected1[buttonIndex] = true;
                                  } else {
                                    isSelected1[buttonIndex] = false;
                                  }
                                }
                              });
                            },
                            isSelected: isSelected1,
                          ),
                        ],
                      ),
                    ),
//                    ListTile(
//                      trailing: ToggleButtons(
//                        borderColor: HexColor('bbce00'),
//                        fillColor: HexColor('bbce00'),
//                        borderWidth: 2,
//                        selectedBorderColor: HexColor('bbce00'),
//                        selectedColor: Colors.white,
//                        borderRadius: BorderRadius.circular(25),
//                        children: [
//                          Padding(
//                            padding: const EdgeInsets.all(8.0),
//                            child: Text(
//                              'TH',
//                              style: TextStyle(fontSize: 16),
//                            ),
//                          ),
//                          Padding(
//                            padding: const EdgeInsets.all(8.0),
//                            child: Text(
//                              'EN',
//                              style: TextStyle(fontSize: 16),
//                            ),
//                          ),
//                        ],
//                        onPressed: (int index) {
//                          setState(() {
//                            for (int buttonIndex = 0;
//                                buttonIndex < isSelected1.length;
//                                buttonIndex++) {
//                              if (buttonIndex == index) {
//                                isSelected1[buttonIndex] = true;
//                              } else {
//                                isSelected1[buttonIndex] = false;
//                              }
//                            }
//                          });
//                        },
//                        isSelected: isSelected1,
//                      ),
//                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Login())),
                        child: Container(
                          height: 30,
                          width: 500,
                          child: Text(
                            'ออกจากระบบ',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
//                    ListTile(
//                      title: Text('ออกจากระบบ'),
//                      onTap: () => Navigator.of(context).pushReplacement(
//                          MaterialPageRoute(builder: (context) => Login())),
//                    ),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
