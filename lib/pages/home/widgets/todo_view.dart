import 'package:flutter/material.dart';
import 'package:tasks/pages/home/widgets/todo_entity.dart';
import 'package:tasks/pages/home/widgets/todo_widget.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key, required this.todoList});

  final List<ToDoEntity> todoList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return ToDoWidget(
          todo: todoList[index],
          onToggleFavorite: () {},
          onToggleDone: () {},
        );
      },
    );
  }
}
