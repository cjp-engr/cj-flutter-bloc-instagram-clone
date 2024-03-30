import 'package:flutter/material.dart';

enum InstaColor { primary, secondary, tertiary, disabled, alert, transparent }

const Map<InstaColor, Color> applyColor = {
  InstaColor.primary: Color.fromRGBO(35, 36, 36, 1),
  InstaColor.secondary: Color.fromRGBO(30, 129, 176, 1),
  InstaColor.tertiary: Color.fromRGBO(252, 252, 252, 1),
  InstaColor.disabled: Color.fromRGBO(223, 207, 190, 1),
  InstaColor.alert: Color.fromRGBO(221, 65, 36, 1),
  InstaColor.transparent: Color.fromARGB(0, 0, 0, 0),
};
