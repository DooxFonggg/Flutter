import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(title: Text('Fong app')),
    body: Body(),
  )));
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        child: Text('hello im fong'),
        // color: Colors.amberAccent,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 10),
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(8, 8),
                color: Colors.pink,
                blurRadius: 10,
              )
            ]),
      ),
    );
  }
}
