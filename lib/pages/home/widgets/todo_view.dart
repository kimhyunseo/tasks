import 'package:flutter/material.dart';
import 'package:tasks/pages/home/widgets/todo_entity.dart';
import 'package:tasks/pages/home/widgets/todo_widget.dart';
import 'package:tasks/pages/todo_detail/todo_detail_page.dart';

class TodoView extends StatelessWidget {
  const TodoView({
    super.key,
    required this.todoList,
    required this.onToggleFavorite,
    required this.onToggleDone,
  });

  final List<ToDoEntity> todoList;
  final void Function(int) onToggleFavorite;
  final void Function(int) onToggleDone;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(12, 12, 12, 150),
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        // TODO: 질문하기, 제일 큰 부모를 제스쳐로 감싼 뒤에 onTap을 해도 안에 자식들에게 영향이 안 가는지?
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TodoDetailPage(index: index, todoList: todoList);
                },
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
