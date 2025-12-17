import 'package:flutter/material.dart';

class PlusTodo extends StatefulWidget {
  const PlusTodo({super.key, required this.onCreate});

  final void Function(String) onCreate;

  @override
  State<PlusTodo> createState() => _PlusTodoState();
}

class _PlusTodoState extends State<PlusTodo> {
  TextEditingController controller = TextEditingController();

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
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            textInputAction: TextInputAction.done,
            autofocus: true,
            onSubmitted: (value) {
              if (value.trim().isEmpty) return;

              widget.onCreate(value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              hintText: "새 할 일",
              hintStyle: TextStyle(fontSize: 14),
              border: InputBorder.none,
            ),
            style: TextStyle(fontSize: 16),
          ),
          Row(
            children: [
              Icon(Icons.short_text_rounded, size: 24),
              Icon(Icons.star_border_rounded, size: 24),
            ],
          ),
        ],
      ),
    );
  }
}
