import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: SafeArea(
          child: Scaffold(
    appBar: AppBar(title: Text('App Fong')),
    body: Body(),
  ))));
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: OutlinedButton(
          onPressed: () => print('Hello'),
          child: Text('Click me'),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.black,
            padding: EdgeInsets.all(20),
            textStyle: TextStyle(fontSize: 20, color: Colors.blue),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80),
            ),
          ),
        ),
      ),
    );
  }
}
