import 'package:flutter/material.dart';
import 'package:unexpected_lines_in_flutter/column_case_page.dart';
import 'package:unexpected_lines_in_flutter/custom_multi_child_layout_case_page.dart';
import 'package:unexpected_lines_in_flutter/row_case_page.dart';
import 'package:unexpected_lines_in_flutter/stack_case_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    Case.values.forEach((c) {
      children.add(TextButton(
          child: Text(c.name()),
          onPressed: () {
            _open(context, c);
          }));
    });

    Column menu = Column(
        children: children, crossAxisAlignment: CrossAxisAlignment.stretch);

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(child: menu, padding: EdgeInsets.all(16)))));
  }

  _open(BuildContext context, Case c) {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => _buildPage(c)));
  }

  Widget _buildPage(Case c) {
    if (c == Case.column) {
      return ColumnCasePage();
    } else if (c == Case.row) {
      return RowCasePage();
    } else if (c == Case.stack) {
      return StackCasePage();
    } else if (c == Case.custom_multi_child_layout) {
      return CustomMultiChildLayoutCasePage();
    }

    throw Exception('Unexpected case: ' + c.name());
  }
}

enum Case { column, row, stack, custom_multi_child_layout }

extension ToString on Case {
  String name() {
    return this.toString().split('.').last;
  }
}
