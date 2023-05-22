// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pintor_todolist/homepage.dart';
import 'package:provider/provider.dart';
import 'provider/todoprovider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => ToDoListProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
