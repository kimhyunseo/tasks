import 'package:flutter/material.dart';
import 'package:tasks/pages/home/widgets/todo_entity.dart';

class TodoDetailPage extends StatefulWidget {
  const TodoDetailPage({
    super.key,
    required this.todoList,
    required this.index,
    required this.onToggleFavorite,
  });
  final List<ToDoEntity> todoList;
  final int index;
  final VoidCallback onToggleFavorite;

  @override
  State<TodoDetailPage> createState() => _TodoDetailPageState();
}

class _TodoDetailPageState extends State<TodoDetailPage> {
  late TextEditingController controller;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(
      text: widget.todoList[widget.index].title,
    );
    descriptionController = TextEditingController(
      text: widget.todoList[widget.index].description ?? "",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: 돌아가는 버튼 구현하기
        // leading: Icon(Icons.arrow_back_rounded),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.onToggleFavorite();
              });
            },
            icon: widget.todoList[widget.index].isFavorite
                ? Icon(Icons.star_rounded, size: 28)
                : Icon(Icons.star_border_rounded, size: 28),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: controller,
              minLines: 1,
              maxLines: 3,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.only(left: 20),
                hintStyle: TextStyle(fontSize: 14),
                border: InputBorder.none,
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.short_text_rounded, size: 32),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: descriptionController,
                    minLines: 1,
                    maxLines: 8,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(left: 20),
                      hintStyle: TextStyle(fontSize: 14),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
