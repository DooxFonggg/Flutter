import 'dart:isolate';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IStorage {
  void savevalue(int value);
  Future<int> getvalue();
}

class Storage implements IStorage {
  @override
  Future<int> getvalue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Try reading data from the 'counter' key. If it doesn't exist, returns null.
    final int? counter = prefs.getInt('counter');
    return counter ?? 0;
  }

  @override
  Future<void> savevalue(int value) async {
    // TODO: implement savevalue
    //lưu dữ liêu biến count vào shared preferences
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('counter', value);
  }
}

abstract class CounterBlocEvent extends Equatable {
  const CounterBlocEvent();
}

class counterImplemet implements CounterBlocEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

class CounterBlocBloc extends Bloc<CounterBlocEvent, int> {
  //couter bloc ở tầng giữa => sử dụng được lớp phân tách count
  Storage S;
  CounterBlocBloc(this.S) : super(0) {
    S.getvalue().then((value) =>
        emit(value)); // lấy value từ shared preferences xong dưa vào emit
    on<counterImplemet>((event, emit) {
      //mỗi khi tiếp nhận sự kiện  tăng lên 1 giá trị và lưu vào shared preferences
      S.savevalue(state + 1);
      emit(state + 1);
    });
  }
}

void main() {
  runApp(RepositoryProvider(
    create: (context) => Storage(),
    child: MaterialApp(home: Home()),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBlocBloc(context.read<Storage>()),
      child: SafeArea(child: Page()),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBlocBloc(context.read<Storage>()),
      child: Scaffold(
        appBar: AppBar(title: Text('Hello World')),
        body: Center(
            child: Column(
          children: [
            BlocBuilder<CounterBlocBloc, int>(
              builder: (context, state) {
                return Text('Counter: $state', style: TextStyle(fontSize: 30));
              },
            ),
            btn()
          ],
        )),
      ),
    );
  }
}

class btn extends StatelessWidget {
  const btn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBlocBloc(context.read<Storage>()),
      child: FloatingActionButton(
          onPressed: () {
            context.read<CounterBlocBloc>().add(new counterImplemet());
          },
          child: Icon(Icons.add)),
    );
  }
}
