import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: SafeArea(
          child: Scaffold(
    appBar: AppBar(
      title: Text('fong app'),
    ),
    body: Body(),
  ))));
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: RichText(
            text: TextSpan(children: [
      TextSpan(
        text: 'hello',
        style: TextStyle(
          color: Colors.red,
          fontSize: 30,
        ),
      ),
      TextSpan(
          text: ' World',
          style: TextStyle(
            color: Colors.red,
            fontSize: 30,
          )),
      TextSpan(
          text: '\nIm Fong đz',
          style: TextStyle(color: Colors.black, fontSize: 30))
    ])));
  }
}
