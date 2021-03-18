import 'package:flutter/material.dart';

class CustomMultiChildLayoutCasePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('CustomMultiChildLayout')),
        backgroundColor: Colors.red,
        body: CustomMultiChildLayout(
          delegate: _CustomMultiChildLayoutDelegate(),
          children: [
            _buildChild(id: 1),
            _buildChild(id: 2),
            _buildChild(id: 3),
            _buildChild(id: 4),
          ],
        ));
  }

  Widget _buildChild({required int id}) {
    return LayoutId(
        id: id,
        child:
            Container(child: Center(child: Text('$id')), color: Colors.white));
  }
}

class _CustomMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    double width = 60;
    double dx = 0;
    for (int i = 1; i <= 4; i++) {
      layoutChild(i, BoxConstraints(maxWidth: width, maxHeight: size.height));
      positionChild(i, Offset(dx, 0));
      dx += width;
      width += 30 * i;
    }
  }

  @override
  bool shouldRelayout(_CustomMultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}
