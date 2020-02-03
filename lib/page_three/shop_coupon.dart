import 'package:flutter/material.dart';

class Shop_Coupon extends StatefulWidget {
  @override
  _Shop_CouponState createState() => _Shop_CouponState();
}

class _Shop_CouponState extends State<Shop_Coupon> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: Card(
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/member.jpg'),
                Text('Test'),
              ],
            ),
          ),
        )
      ],
    );
  }
}
