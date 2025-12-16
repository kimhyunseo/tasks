import 'package:flutter/material.dart';

class ToDoView extends StatelessWidget {
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
          Icon(Icons.check_circle),
          SizedBox(width: 12),
          Text("할 일 목 록"),
          Spacer(),
          Icon(Icons.star_rounded),
        ],
      ),
    );
  }
}
