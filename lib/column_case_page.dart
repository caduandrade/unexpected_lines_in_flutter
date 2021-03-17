import 'package:flutter/material.dart';

class ColumnCasePage extends StatelessWidget {
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (int i = 1; i <= 10; i++) {
      children.add(_buildChild(value: i, flex: i * 2));
    }
    return Scaffold(
        appBar: AppBar(title: Text('Column')),
        backgroundColor: Colors.red,
        body: Column(
            children: children,
            crossAxisAlignment: CrossAxisAlignment.stretch));
  }

  Widget _buildChild({required int value, required int flex}) {
    return Expanded(
      child:
          Container(child: Center(child: Text('$value')), color: Colors.white),
      flex: flex,
    );
  }
}
