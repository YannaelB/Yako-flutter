import 'package:flutter/material.dart';
import 'constant.dart';

class BottomBar extends BottomAppBar{
  BottomBar({@required List<Widget> items}) :super(
    color: bleu4,
    shape: CircularNotchedRectangle(),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,

      children: items,
    ),
  );
}