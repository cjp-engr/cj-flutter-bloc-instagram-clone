import 'package:flutter/material.dart';

const String _fontFamily = 'Poppins';

ThemeData themeData = ThemeData.dark(
  useMaterial3: true,
).copyWith(
  primaryTextTheme: ThemeData()
      .primaryTextTheme
      .apply(fontFamily: _fontFamily, bodyColor: Colors.white),
  textTheme: ThemeData()
      .textTheme
      .apply(fontFamily: _fontFamily, bodyColor: Colors.white),
);
