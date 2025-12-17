import 'package:flutter/material.dart';
import 'package:tasks/pages/home/widgets/todo_entity.dart';

class TodoDetailPage extends StatelessWidget {
  const TodoDetailPage({
    super.key,
    required this.todoList,
    required this.index,
  });
  final List<ToDoEntity> todoList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.star_rounded, size: 28),
            ),
          ),
        ],
      ),
      body: Column(children: [Text(todoList[index].title)]),
    );
  }
}
