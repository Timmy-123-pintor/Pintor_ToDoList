import 'package:flutter/material.dart';
import 'package:pintor_todolist/components/finishedwidget.dart';
import 'package:provider/provider.dart';
import '../constant.dart';
import '../provider/todoprovider.dart';
import 'todoList.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({super.key});

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int currrentIndex = 0;
  final pages = [
    Consumer<ToDoListProvider>(
      builder: (context, value, child) {
        return ToDoListWidget(
          list: value.list,
        );
      },
    ),
    Consumer<ToDoListProvider>(
      builder: (context, value, child) {
        return FinishedList(
          list: value.completed,
        );
      },
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: tBG,
        selectedItemColor: tWhite,
        unselectedItemColor: tGray,
        currentIndex: currrentIndex,
        onTap: (index) => setState(() {
          currrentIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.checklist_outlined), label: 'Todos'),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Completed')
        ],
      ),
    );
  }
}
