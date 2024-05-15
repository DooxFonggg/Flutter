import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class countCubit extends Cubit<int> {
  countCubit() : super(0);
  void increment() => emit(state + 1);
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SafeArea(child: Page()),
  ));
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => countCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('App fong'),
        ),
        body: Center(
          child: Column(
            children: [
              BlocBuilder<countCubit, int>(
                builder: (context, state) {
                  return Container(
                    child: Text(
                      'Counter: $state',
                      style: TextStyle(fontSize: 30),
                    ),
                  );
                },
              )

              // Your other widgets here
            ],
          ),
        ),
        floatingActionButton: flBtn(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.endFloat, // This line
      ),
    );
  }
}

class flBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => countCubit(),
      child: FloatingActionButton(
        onPressed: () {
          context.read<countCubit>().increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
