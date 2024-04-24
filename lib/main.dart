import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: SafeArea(
          child: Scaffold(
    body: Body(),
  ))));
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [Text('Home'), Text("About"), Text("Contact")],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("yyyy/mm/dd"),
                        Expanded(
                            flex: 2,
                            child: Container(
                                child: Row(
                              children: [Text("yyyy")],
                            ))),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Row(
                              children: [Text("mm")],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text("dd"),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
