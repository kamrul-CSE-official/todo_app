import 'package:flutter/material.dart';

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
    ];

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
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  toDoLst[index][0],
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
