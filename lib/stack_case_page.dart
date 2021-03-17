import 'package:flutter/material.dart';

class StackCasePage extends StatelessWidget {
  Widget build(BuildContext context) {
    double left = 0;
    double width = 30;

    List<Widget> children = [];
    for (int i = 1; i <= 10; i++) {
      children.add(_buildChild(value: i, left: left, width: width));
      left += width;
      width += i * 5;
    }
    return Scaffold(
        appBar: AppBar(title: Text('Stack')),
        backgroundColor: Colors.red,
        body: Stack(children: children));
  }

  Widget _buildChild(
      {required int value, required double left, required double width}) {
    return Positioned(
        left: left,
        top: 0,
        bottom: 0,
        child: Container(
            width: width,
            child: Center(child: Text('$value')),
            color: Colors.white));
  }
}
