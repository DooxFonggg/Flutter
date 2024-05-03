import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: SafeArea(
          child: Scaffold(
    appBar: AppBar(
      title: Text('Hello World'),
    ),
    body: Body(10),
  ))));
}

class Body extends StatefulWidget {
  int count = 0;
  Body(this.count, {super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height / 2,
          child: PageView.builder(
            itemCount: widget.count,
            itemBuilder: (context, index) {
              return Container(
                color: index % 2 == 0 ? Colors.red : Colors.blue,
                child: Text(
                  "page $index",
                  style: TextStyle(color: Colors.deepPurple, fontSize: 30),
                ),
                alignment: Alignment.center,
              );
            },
            onPageChanged: (value) {
              setState(() {
                index = value;
              });
            },
          ),
        ),
        PageIndicator(widget.count, index),
      ],
    );
  }
}

class PageIndicator extends StatelessWidget {
  int index = 0;
  int count = 0;
  PageIndicator(this.count, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 3,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < count; i++)
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: i == index ? Colors.green : Colors.grey,
                  shape: BoxShape.circle),
            ),
        ],
      ),
    );
  }
}
