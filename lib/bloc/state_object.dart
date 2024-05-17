// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/bloc/bloc_provider_bloc_builder.dart';
import 'package:flutter_tutorial/bloc/model3classBloc.dart';

//note: CounterCubitState dùng để định nghĩa tất cả các biến sử dụng trong CounterCubit
sealed class CounterCubitState extends Equatable {
  const CounterCubitState();

  @override
  List<Object> get props => [];
}

class counterCubitInitial extends CounterCubitState {}

class CounterCubitLoad extends CounterCubitState {
  final int value;
  final List<int> history;

  CounterCubitLoad({
    required this.value,
    required this.history,
  });
  // method copyWith là tạo tối tượng phục vụ cho hàm emit
  CounterCubitLoad copyWith({
    int? value,
    List<int>? history,
  }) {
    return CounterCubitLoad(
      value: value ?? this.value,
      history: history ?? this.history,
    );
  }

  // tạo key để bắt key dữ liệu đồng thời tạo ra 1 chuỗi json
  @override
  List<Object> get props => [value, history];
}

//event
class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(CounterCubitLoad(value: 0, history: []));

  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 3));
    emit(CounterCubitLoad(value: 0, history: []));
  }

  void changeData(int value) {
    //nếu trạng thái hiện tại là CounterCubitLoad
    if (state is CounterCubitLoad) {
      //ép kiểu state về CounterCubitLoad (do CounterCubit không chứa value và history)
      final currentState = state as CounterCubitLoad;
      // khởi tạo giá trị mới
      emit(currentState.copyWith(
        value: currentState.value + value,
        history: [...currentState.history, currentState.value + value],
      ));
    }
  }

  void clearData() {
    //ép kiểu state về CounterCubitLoad (do CounterCubit không chứa value và history)
    final currentState = state as CounterCubitLoad;
    // khởi tạo giá trị mới với value không đổi
    emit(currentState.copyWith(
      history: [],
    ));
  }
}

void main() {
  runApp(BlocProvider(
    create: (context) => CounterCubit()..loadData(),
    child: MaterialApp(
        home: SafeArea(
            child: Scaffold(
      body: Page(),
    ))),
  ));
}

class Page extends StatelessWidget {
  const Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Center(
        child: Column(
          children: [
            BlocBuilder<CounterCubit, CounterCubitState>(
              builder: (context, state) {
                if (state is! CounterCubitLoad)
                  return CircularProgressIndicator();
                final currentState = state as CounterCubitLoad;
                return Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterCubit>().changeData(1);
                        },
                        child: Text('Tăng')),
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterCubit>().changeData(-1);
                        },
                        child: Text('giảm')),
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterCubit>().clearData();
                        },
                        child: Text('xóa')),
                    Text(
                      'Counter: ${currentState.value}',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text('History'),
                    for (int i = 0; i < currentState.history.length; i++)
                      Text('${currentState.history[i]}')
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
// note: bloc listener cũng giống bulder nhưng nó không trả về widget mà nó sẽ thực hiện 1 hành động nào đó ví dụ thông báo hay in ra màn hình
// listener không đề cập đến việc xây dựng dao diện 
//bloc comsumer = listener + builder 