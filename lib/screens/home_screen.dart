import 'package:flutter/material.dart';
import 'package:my_app/colors/Colors.dart';
//import 'package:my_app/screens/add_screen.dart';
//import 'package:my_app/page_one/home_test.dart';
import 'package:my_app/screens/page_one.dart';
import 'package:my_app/screens/page_two.dart';
import 'package:my_app/screens/page_three.dart';
import 'package:my_app/screens/Page_four.dart';
import 'package:my_app/screens/Page_five.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List pages = [PageOne(), PageTwo(), Pagethree(), Pagefour(), Pagefive()];

  @override
  Widget build(BuildContext context) {
//    Widget floatingAction = FloatingActionButton(
//        backgroundColor: Colors.green,
//        onPressed: () {
//          Navigator.push(
//              context,
//              MaterialPageRoute(
//                  builder: (context) => AddScreen('Hello flutter')));
//        },
//        child: Icon(Icons.chat_bubble_outline));

//    Widget appBar = AppBar(
//      title: Container(
//        height: 50,
//        child: Card(
//          child: Image.asset(
//            'assets/images/BigC.png',
//            width: 40,
//            height: 40,
//          ),
//        ),
//      ),
//      actions: <Widget>[
//        Padding(
//          padding: const EdgeInsets.only(
//              left: 0.0, top: 14, right: 0.0, bottom: 0.0),
//          child: IconButton(
//              icon: Icon(
//                Icons.monetization_on,
//              ),
//              onPressed: () {}),
//        ),
//        Column(
//          children: <Widget>[
//            Center(
//              child: Padding(
//                padding: const EdgeInsets.only(
//                    left: 0.0, top: 22, right: 10.0, bottom: 0.0),
//                child: Text(
//                  '$pointPost',
//                  style: TextStyle(fontSize: 20.0),
//                ),
//              ),
//            ),
//          ],
//        ),
//        Padding(
//          padding: const EdgeInsets.only(
//              left: 0.0, top: 12, right: 0.0, bottom: 0.0),
//          child: Text(
//            '|',
//            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w100),
//          ),
//        ),
//        Padding(
//          padding: const EdgeInsets.only(
//              left: 0.0, top: 14, right: 0.0, bottom: 0.0),
//          child: IconButton(
//              icon: Icon(Icons.notifications_active), onPressed: () {}),
//        )
//      ],
//    );

    Widget bottomNavBar = BottomNavigationBar(
        fixedColor: HexColor('bbce00'),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.home,
              ),
              title: Text('หน้าหลัก')),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.moneyBillWave,
              ),
              title: Text('คูปองบิ๊กซี')),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.moneyBillWaveAlt,
              ),
              title: Text('คูปองร้านค้า')),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.shoppingBag),
              title: Text('คูปองของฉัน')),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.cog), title: Text('ตั้งค่า')),
        ]);

    //pages[currentIndex]

    return Scaffold(
//      appBar: appBar,

      body: pages[currentIndex],
//      floatingActionButton: floatingAction,
      bottomNavigationBar: bottomNavBar,
    );
  }
}
