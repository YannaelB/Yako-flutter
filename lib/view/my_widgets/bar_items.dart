import 'package:flutter/material.dart';
import 'constant.dart';

class BarItem extends IconButton {
  BarItem({@required Icon icon, @required VoidCallback onPressed, @required bool selected}) : super(
    icon: icon,
    onPressed: onPressed,
    color: selected ? white: Colors.cyan[50],
    //Icons.format_size : 20.0,
  );
}