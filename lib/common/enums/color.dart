import 'package:flutter/material.dart';

enum InstaColor { primary, secondary, tertiary, disabled }

const Map<InstaColor, Color> buttonColor = {
  InstaColor.primary: Color.fromRGBO(66, 66, 66, 1),
  InstaColor.secondary: Color.fromRGBO(33, 150, 243, 1),
  InstaColor.tertiary: Color.fromRGBO(252, 252, 252, 1),
  InstaColor.disabled: Color.fromRGBO(205, 203, 203, 1),
  // InstaButtonColor.icon: "Element 4",
};
