import 'package:flutter/material.dart';
import 'package:tasks/pages/home/widgets/todo_entity.dart';

class ToDoWidget extends StatefulWidget {
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
  State<ToDoWidget> createState() => _ToDoWidgetState();
}

class _ToDoWidgetState extends State<ToDoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          widget.todo.isDone
              ? IconButton(
                  onPressed: () {
                    widget.onToggleDone();
                  },
                  icon: Icon(Icons.check_circle_rounded, size: 24),
                )
              : IconButton(
                  onPressed: () {
                    widget.onToggleDone();
                  },
                  icon: Icon(Icons.circle_outlined, size: 24),
                ),
          SizedBox(width: 12),

          Text(
            widget.todo.title,
            style: TextStyle(
              decoration: widget.todo.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: widget.todo.isDone ? Colors.black45 : Colors.black,
            ),
          ),
          Spacer(),
          widget.todo.isFavorite
              ? IconButton(
                  onPressed: () {
                    widget.onToggleFavorite();
                  },
                  icon: Icon(Icons.star_rounded, size: 28),
                )
              : IconButton(
                  onPressed: () {
                    widget.onToggleFavorite();
                  },
                  icon: Icon(Icons.star_border_rounded, size: 28),
                ),
        ],
      ),
    );
  }
}
