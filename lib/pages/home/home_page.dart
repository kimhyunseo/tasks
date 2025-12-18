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

  void onCreate(ToDoEntity newTodo) {
    setState(() {
      todoList.add(newTodo);
    });
  }

  void toggleFavorite(int index) {
    setState(() {
      todoList[index] = todoList[index].copyWith(
        isFavorite: !todoList[index].isFavorite,
      );
    });
  }

  void toggleDone(int index) {
    setState(() {
      todoList[index] = todoList[index].copyWith(
        isDone: !todoList[index].isDone,
      );
    });
  }

  void showSnack(BuildContext bottomSheetContext, String message) {
    ScaffoldMessenger.of(bottomSheetContext).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 5),
        margin: EdgeInsets.only(bottom: 400),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            builder: (bottomContext) => PlusTodo(onCreate: onCreate),
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
              : Expanded(
                  child: TodoView(
                    todoList: todoList,
                    onToggleDone: toggleDone,
                    onToggleFavorite: toggleFavorite,
                  ),
                ),
        ],
      ),
    );
  }
}
