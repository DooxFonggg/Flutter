import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Widget2(
        check: true,
      ),
    ),
  );
}

class Widget1 extends StatelessWidget {
  final bool check;
  Widget1(this.check, {super.key});
  @override
  Widget build(BuildContext context) {
    return check ? const Text('on') : const Text('off');
  }
}

// ignore: prefer_typing_uninitialized_variables
class Widget2 extends StatefulWidget {
  final bool check;
  Widget2({required this.check, Key? key}) : super(key: key);

  @override
  _Widget2State createState() => _Widget2State();
}

class _Widget2State extends State<Widget2> {
  late bool checkState;
  @override
  void initState() {
    super.initState();
    checkState = widget.check;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            checkState = !checkState;
          });
        },
        child: checkState ? const Text('on') : const Text('off'));
  }
}
