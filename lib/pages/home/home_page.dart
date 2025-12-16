import 'package:flutter/material.dart';
import 'package:tasks/pages/home/widgets/empty_todo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hyunseo's Tasks",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(Icons.add, color: Colors.white, size: 24),
      ),
      body: Column(children: [EmptyTodo()]),
    );
  }
}
