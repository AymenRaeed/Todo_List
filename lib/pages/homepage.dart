import 'package:flutter/material.dart';
import 'package:talbat1/Util/dialog_box.dart';
import 'package:talbat1/Util/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _controller = TextEditingController();

  List todoList = [
    ["Make tutorial", false],
    ["Do Exercises", false]
  ];

  void checkboxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      Navigator.of(context).pop();
      _controller.clear();
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onsave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('TO DO'),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: Colors.amber),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          backgroundColor: Colors.amber,
          child: const Icon(Icons.add)),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => checkboxChanged(value, index),
          );
        },
      ),
    );
  }
}
