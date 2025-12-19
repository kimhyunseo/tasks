import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks/models/todo_entity.dart';
import 'package:tasks/pages/home/widgets/todo_widget.dart';
import 'package:tasks/pages/todo_detail/todo_detail_page.dart';

// 5. To do가 추가된 화면 만들기

class TodoView extends StatelessWidget {
  const TodoView({
    super.key,
    required this.todoList,
    required this.onToggleFavorite,
    required this.onToggleDone,
    required this.deleteTodo,
    required this.editTodo,
  });

  final List<ToDoEntity> todoList;
  final void Function(int) onToggleFavorite;
  final void Function(int) onToggleDone;
  final void Function(int) deleteTodo;
  final void Function(int, String, String) editTodo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(12, 12, 12, 150),
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TodoDetailPage(
                    index: index,
                    todoList: todoList,
                    onToggleFavorite: () => onToggleFavorite(index),
                    deleteTodo: () => deleteTodo(index),
                    editTodo: editTodo,
                  );
                },
              ),
            );
          },
          onLongPress: () {
            showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: Text("삭제 확인"),
                content: Text("정말 삭제하시겠습니까?"),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("취소"),
                  ),
                  CupertinoDialogAction(
                    isDestructiveAction: true,
                    onPressed: () {
                      deleteTodo(index);
                      Navigator.pop(context);
                    },
                    child: Text("삭제"),
                  ),
                ],
              ),
            );
          },
          child: ToDoWidget(
            todo: todoList[index],
            onToggleFavorite: () {
              onToggleFavorite(index);
            },
            onToggleDone: () {
              onToggleDone(index);
            },
          ),
        );
      },
    );
  }
}
