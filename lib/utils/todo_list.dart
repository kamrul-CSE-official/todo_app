import 'package:flutter/material.dart';

class todo_list extends StatefulWidget {
  const todo_list({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  @override
  State<todo_list> createState() => _todo_listState();
}

class _todo_listState extends State<todo_list> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Checkbox(value: widget.taskCompleted, onChanged: widget.onChanged),
            Text(
              widget.taskName,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
