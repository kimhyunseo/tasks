import 'package:flutter/material.dart';
import 'package:tasks/pages/home/widgets/empty_todo.dart';
import 'package:tasks/pages/home/widgets/plus_todo.dart';
import 'package:tasks/pages/home/widgets/todo_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hyunseo's Tasks",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            // TODO: 바텀 시트 보이게 구현
            MaterialPageRoute(
              builder: (context) {
                return PlusTodo();
              },
            ),
          );
        },
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(Icons.add, color: Colors.white, size: 24),
      ),
      body: Column(children: [EmptyTodo(), ToDoView()]),
    );
  }
}
