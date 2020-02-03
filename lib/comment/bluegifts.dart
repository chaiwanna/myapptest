import 'package:flutter/material.dart';

class BlueGifts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
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
  bool liked2 = false;
  bool liked3 = false;
  bool liked4 = false;
  _pressed() {
    setState(() {
      liked = !liked;
    });
  }

  _pressedone() {
    setState(() {
      liked1 = !liked1;
    });
  }

  _pressedtwo() {
    setState(() {
      liked2 = !liked2;
    });
  }

  _pressedthree() {
    setState(() {
      liked3 = !liked3;
    });
  }

  _pressedfour() {
    setState(() {
      liked4 = !liked4;
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
                  width: 200.0,
                ),
                Text('จักรยาน'),
                IconButton(
                    icon: Icon(
                      liked ? Icons.favorite : Icons.favorite_border,
                      color: liked ? Colors.red : Colors.grey,
                    ),
                    onPressed: () => _pressed())
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
                  width: 200.0,
                ),
                Text('จักรยาน'),
                IconButton(
                    icon: Icon(
                      liked1 ? Icons.favorite : Icons.favorite_border,
                      color: liked1 ? Colors.red : Colors.grey,
                    ),
                    onPressed: () => _pressedone())
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
                  width: 200.0,
                ),
                Text('จักรยาน'),
                IconButton(
                    icon: Icon(
                      liked2 ? Icons.favorite : Icons.favorite_border,
                      color: liked2 ? Colors.red : Colors.grey,
                    ),
                    onPressed: () => _pressedtwo())
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
                  width: 200.0,
                ),
                Text('จักรยาน'),
                IconButton(
                    icon: Icon(
                      liked3 ? Icons.favorite : Icons.favorite_border,
                      color: liked3 ? Colors.red : Colors.grey,
                    ),
                    onPressed: () => _pressedthree())
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
                  width: 200.0,
                ),
                Text('จักรยาน'),
                IconButton(
                    icon: Icon(
                      liked4 ? Icons.favorite : Icons.favorite_border,
                      color: liked4 ? Colors.red : Colors.grey,
                    ),
                    onPressed: () => _pressedfour())
              ],
            ),
          ),
        ),
      ],
    );
  }
}
