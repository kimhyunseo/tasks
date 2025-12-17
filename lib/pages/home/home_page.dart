import 'package:flutter/material.dart';
import 'package:tasks/pages/home/widgets/empty_todo.dart';
import 'package:tasks/pages/home/widgets/plus_todo.dart';
import 'package:tasks/pages/home/widgets/todo_entity.dart';
import 'package:tasks/pages/home/widgets/todo_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String appName = 'Hyunseo\'s Tasks';
  List<ToDoEntity> todoList = [];

  void onCreate(String todoTitle) {
    setState(() {
      ToDoEntity newTodo = ToDoEntity(
        title: todoTitle,
        isDone: false,
        isFavorite: false,
      );
      todoList.add(newTodo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => PlusTodo(onCreate: onCreate),
          );
        },
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(Icons.add, color: Colors.white, size: 24),
      ),
      body: Column(
        children: [
          todoList.isEmpty
              ? EmptyTodo(appName: appName)
              : Expanded(child: TodoView(todoList: todoList)),
        ],
      ),
    );
  }
}
