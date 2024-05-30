import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson47/logic/bloc/todo_bloc.dart';
import 'package:lesson47/viewmodels/todo_view_model.dart';
import 'package:lesson47/views/screens/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(TodoViewModel())..add(LoadTodos()),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
