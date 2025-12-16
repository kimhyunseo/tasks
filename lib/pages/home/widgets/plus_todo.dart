import 'package:flutter/material.dart';

class PlusTodo extends StatelessWidget {
  const PlusTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 0),

          child: Column(
            children: [
              TextField(
                textInputAction: TextInputAction.done,
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
      },
    );
  }
}
