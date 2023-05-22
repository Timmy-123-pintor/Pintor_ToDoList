import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';
import 'components/bottomNavBar.dart';
import 'constant.dart';
import 'provider/todoprovider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BotNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItem(context);
        },
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> addItem(BuildContext context) async {
    TextEditingController controller = TextEditingController();
    TextEditingController descController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: const Text(
              'Add a Todo',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: tBG,
              ),
            ),
            content: SizedBox(
              height: 150,
              width: 500,
              child: Column(
                children: [
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Task',
                    ),
                  ),
                  const Spacer(),
                  TextField(
                    controller: descController,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Description',
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      final newItem = ToDo(
                          toDo: controller.text,
                          description: descController.text);
                      context.read<ToDoListProvider>().add(newItem);
                      controller.clear();
                      descController.clear();
                      const snackBar = SnackBar(content: Text('Added'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'Enter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  )),
            ],
          );
        });
  }
}
