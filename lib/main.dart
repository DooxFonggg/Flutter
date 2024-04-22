import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('App bar'),
            backgroundColor: Colors.red,
          ),
          body: SafeArea(
            child: Center(
              child: Text("center text"),
            ),
          )),
    ),
  );
}
