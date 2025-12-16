import 'package:flutter/material.dart';

class EmptyTodo extends StatelessWidget {
  const EmptyTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Icon(Icons.ac_unit_sharp, size: 60),
          ),
          Text(
            "아직 할 일이 없음",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2),
          Text(
            "할 일을 추가하고 ${AppBar()}에서\n할 일을 추적하세요.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
