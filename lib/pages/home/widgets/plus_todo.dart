import 'package:flutter/material.dart';
import 'package:tasks/pages/home/widgets/todo_entity.dart';

class PlusTodo extends StatefulWidget {
  const PlusTodo({super.key, required this.onCreate, required this.onSnack});
  final void Function(ToDoEntity) onCreate;
  final void Function(String) onSnack;
  @override
  State<PlusTodo> createState() => _PlusTodoState();
}

class _PlusTodoState extends State<PlusTodo> {
  TextEditingController controller = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isFavorite = false;
  bool isDescription = false;
  final FocusNode titleFocusNode = FocusNode();
  final FocusNode descriptionFocusNode = FocusNode();

  void onSubmit() {
    final value = controller.text;
    final descriptionValue = descriptionController.text;

    if (value.trim().isEmpty) {
      titleFocusNode.requestFocus();
      widget.onSnack("할 일을 입력해주세요");
      return;
    }

    widget.onCreate(
      ToDoEntity(
        title: value,
        isFavorite: isFavorite,
        description: descriptionValue.isNotEmpty ? descriptionValue : null,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 12,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            focusNode: titleFocusNode,
            textInputAction: TextInputAction.done,
            autofocus: true,
            onSubmitted: (_) {
              onSubmit();
            },
            minLines: 1,
            maxLines: 8,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20),
              hintText: "새 할 일",
              hintStyle: TextStyle(fontSize: 14),
              border: InputBorder.none,
            ),
            style: TextStyle(fontSize: 16),
          ),
          isDescription
              ? TextField(
                  controller: descriptionController,
                  focusNode: descriptionFocusNode,
                  textInputAction: TextInputAction.done,
                  autofocus: true,
                  onSubmitted: (_) {
                    onSubmit();
                  },
                  minLines: 1,
                  maxLines: 8,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "세부정보 추가",
                    hintStyle: TextStyle(fontSize: 12),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 14),
                )
              : SizedBox(),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isDescription = true;
                    descriptionFocusNode.requestFocus();
                  });
                },
                icon: Icon(Icons.short_text_rounded, size: 24),
              ),

              IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: isFavorite
                    ? Icon(Icons.star_rounded, size: 24)
                    : Icon(Icons.star_border_rounded, size: 24),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  onSubmit();
                },
                child: Text("저장"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
