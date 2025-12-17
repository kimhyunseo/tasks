import 'package:flutter/material.dart';

class EmptyTodo extends StatelessWidget {
  const EmptyTodo({super.key, required this.appName});
  final String appName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white54,
      ),
      child: Column(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: Image.asset(
                'assets/images/todonyang.webp',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            "아직 할 일이 없음",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 2),
          Text(
            "할 일을 추가하고 $appName에서\n할 일을 추적하세요.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black45),
          ),
        ],
      ),
    );
  }
}
