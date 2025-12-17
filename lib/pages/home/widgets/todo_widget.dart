import 'package:flutter/material.dart';
import 'package:tasks/pages/home/widgets/todo_entity.dart';

class ToDoWidget extends StatelessWidget {
  const ToDoWidget({
    super.key,
    required this.todo,
    required this.onToggleFavorite,
    required this.onToggleDone,
  });

  final ToDoEntity todo;
  final VoidCallback onToggleFavorite;
  final VoidCallback onToggleDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          todo.isDone
              ? Icon(Icons.check_circle_rounded)
              : Icon(Icons.circle_outlined),
          SizedBox(width: 12),
          Text(todo.title),
          Spacer(),
          todo.isFavorite
              ? Icon(Icons.star_rounded)
              : Icon(Icons.star_border_rounded),
        ],
      ),
    );
  }
}
