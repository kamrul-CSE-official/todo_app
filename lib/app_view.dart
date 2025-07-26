import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_list.dart';

class app_view extends StatefulWidget {
  const app_view({super.key});

  @override
  State<app_view> createState() => _app_viewState();
}

class _app_viewState extends State<app_view> {
  final _controller = TextEditingController();

  List toDoLst = [
    ['Learn Flutter', false],
    ['Drink Coffee', false],
    ['White Coffee', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoLst[index][1] = !toDoLst[index][1];
    });
  }

  void saveNewTodo() {
    setState(() {
      toDoLst.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTodo(int index) {
    setState(() {
      toDoLst.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade300,
      appBar: AppBar(
        title: const Text('Simple Todo'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
        child: ListView.builder(
          itemCount: toDoLst.length,
          itemBuilder: (context, index) {
            return todo_list(
              taskName: toDoLst[index][0],
              taskCompleted: toDoLst[index][1],
              onChanged: (value) => checkBoxChanged(index),
              deleteTodo: (contex) => deleteTodo(index),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  controller: _controller,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Add a new todo items...',
                    filled: true,
                    fillColor: Colors.green.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: saveNewTodo,
            backgroundColor: Colors.green,
            child: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
