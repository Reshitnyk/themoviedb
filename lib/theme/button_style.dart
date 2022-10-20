import 'package:flutter/material.dart';

final colorBorder = Color(0xFF01B4E4);

abstract class AppButtonStyle {
  static final ButtonStyle linkButton = ButtonStyle(
      foregroundColor: MaterialStateProperty.all(colorBorder),
      textStyle: MaterialStateProperty.all(
          TextStyle(fontSize: 16, fontWeight: FontWeight.w700)));
}
