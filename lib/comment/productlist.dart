import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Post(),
            ),
          ),
        ],
      ),
    );
  }
}

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  bool liked = false;
  bool liked1 = false;
  _pressed() {
    setState(() {
      liked = !liked;
    });
  }

  _pressed1() {
    setState(() {
      liked1 = !liked1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Card(
          child: Container(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/cycle.jpg',
                  width: 350.0,
                ),
                Text(
                  'จักรยาน',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Card(
                  child: Row(
                    children: <Widget>[
                      Text('รับส่วนลด 20% สำหรับสินค้าทุกรายการ'),
                      IconButton(
                          icon: Icon(
                            liked ? Icons.favorite : Icons.favorite_border,
                            color: liked ? Colors.green : Colors.green,
                            size: 30.0,
                          ),
                          onPressed: () => _pressed())
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/cycle.jpg',
                  width: 350.0,
                ),
                Text('แสงเทียน'),
                Card(
                  child: Row(
                    children: <Widget>[
                      Text('รับส่วนลด 20% สำหรับสินค้าทุกรายการ'),
                      IconButton(
                          icon: Icon(
                            liked1 ? Icons.favorite : Icons.favorite_border,
                            color: liked1 ? Colors.green : Colors.green,
                          ),
                          onPressed: () => _pressed1())
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/cycle.jpg',
                  width: 350.0,
                ),
                Text('น้ำยาสระผมรีจอยร์'),
                Card(
                  child: Row(
                    children: <Widget>[
                      Text('รับส่วนลด 20% สำหรับสินค้าทุกรายการ'),
                      IconButton(
                          icon: Icon(
                            liked ? Icons.favorite : Icons.favorite_border,
                            color: liked ? Colors.green : Colors.green,
                          ),
                          onPressed: () => _pressed())
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/cycle.jpg',
                  width: 350.0,
                ),
                Text('แป้งเย็นตรางู'),
                Card(
                  child: Row(
                    children: <Widget>[
                      Text('รับส่วนลด 20% สำหรับสินค้าทุกรายการ'),
                      IconButton(
                          icon: Icon(
                            liked ? Icons.favorite : Icons.favorite_border,
                            color: liked ? Colors.green : Colors.green,
                          ),
                          onPressed: () => _pressed())
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/cycle.jpg',
                  width: 350.0,
                ),
                Text('โต๊ะ'),
                Card(
                  child: Row(
                    children: <Widget>[
                      Text('รับส่วนลด 20% สำหรับสินค้าทุกรายการ'),
                      IconButton(
                          icon: Icon(
                            liked ? Icons.favorite : Icons.favorite_border,
                            color: liked ? Colors.green : Colors.green,
                          ),
                          onPressed: () => _pressed())
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//import 'package:flutter/material.dart';
//
//class Productlist extends StatefulWidget {
//  @override
//  _ProductlistState createState() => _ProductlistState();
//}
//
//class _ProductlistState extends State<Productlist> {
//  bool liked = false;
//  _pressed() {
//    setState(() {
//      liked = !liked;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Card(
//      child: Container(
//        child: Column(
//          children: <Widget>[
//            Image.asset(
//              'assets/images/cycle.jpg',
//              width: 350.0,
//            ),
//            Text('จักรยาน'),
//            Row(
//              children: <Widget>[
//                Expanded(
//                  child: Text('คะแนน'),
//                ),
//                Expanded(
//                  child: Text(
//                      'รับส่วนลด 20% สำหรับสินค้าราคาปกติทุกรายการ ที่ร้าน Bossini'),
//                ),
//                Expanded(
//                  child: IconButton(
//                    icon: Icon(
//                      liked ? Icons.favorite : Icons.favorite_border,
//                      color: liked ? Colors.red : Colors.grey,
//                    ),
//                    onPressed: () => _pressed(),
//                  ),
//                )
//              ],
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}
//
////class Productlist extends StatelessWidget {
////  bool liked = false;
////
////  _pressed() {}
////
////  @override
////  Widget build(BuildContext context) {
////    return Container(
////      height: 300.0,
////      child: ListView(
////        scrollDirection: Axis.horizontal,
////        children: <Widget>[
////          Card(
////            child: Container(
////              child: Column(
////                children: <Widget>[
////                  Image.asset(
////                    'assets/images/cycle.jpg',
////                    width: 350.0,
////                  ),
////                  Text('จักรยาน'),
////                  Row(),
////                  Row(
////                    children: <Widget>[
////                      IconButton(
////                        icon: Icon(
////                          liked ? Icons.favorite : Icons.favorite_border,
////                          color: liked ? Colors.red : Colors.grey,
////                        ),
////                        onPressed: () => _pressed(),
////                      )
////                    ],
////                  )
////                ],
////              ),
////            ),
////          )
////          Container(
////            padding: EdgeInsets.all(10.0),
////            child: Row(
////              children: <Widget>[
////                PostHeader(),
////                Image.asset(
////                  'assets/images/cycle.jpg',
////                  width: 350.0,
////                ),
////                Icon(Icons.favorite)
////              ],
////            ),
////          ),
////        ],
////      ),
////    );
////  }
////}
//
////class Post extends StatefulWidget {
////  @override
////  _PostState createState() => _PostState();
////}
////
////class _PostState extends State<Post> {
////  bool liked = false;
////  _pressed() {
////    setState(() {
////      liked = !liked;
////    });
////  }
////
////  @override
////  Widget build(BuildContext context) {
////    return Container(
////      height: 300.0,
////      child: ,
////
////    );
////  }
////}
