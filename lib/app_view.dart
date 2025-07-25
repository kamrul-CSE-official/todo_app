import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_list.dart';

class app_view extends StatefulWidget {
  const app_view({super.key});

  @override
  State<app_view> createState() => _app_viewState();
}

class _app_viewState extends State<app_view> {
  @override
  Widget build(BuildContext context) {
    List toDoLst = [
      ['Learn Flutter', false],
      ['Drink Coffee', false],
      ['White Coffee', false],
    ];

    final String taskName;
    final bool taskCompleted;
    final Function(bool?)? onChanged;

    void checkBoxChanged(int index) {
      setState(() {
        toDoLst[index][1] = !toDoLst[index][1];
      });
    }

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text('Simple Todo'),
        backgroundColor: Colors.deepPurple,
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
            );
          },
        ),
      ),
    );
  }
}
