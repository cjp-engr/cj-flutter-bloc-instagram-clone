import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:flutter/material.dart';

const String _fontFamily = 'Poppins';

ThemeData themeData = ThemeData.dark(
  useMaterial3: true,
).copyWith(
  primaryTextTheme: ThemeData().primaryTextTheme.apply(
      fontFamily: _fontFamily, bodyColor: applyColor[InstaColor.tertiary]),
  textTheme: ThemeData().textTheme.apply(
      fontFamily: _fontFamily, bodyColor: applyColor[InstaColor.tertiary]),
  splashColor: applyColor[InstaColor.transparent],
  highlightColor: applyColor[InstaColor.transparent],
  hoverColor: applyColor[InstaColor.transparent],
);
