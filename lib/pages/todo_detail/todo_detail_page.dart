import 'package:flutter/material.dart';

class TodoDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo Detail')),
      body: Center(child: Text('Details of the selected Todo item.')),
    );
  }
}
