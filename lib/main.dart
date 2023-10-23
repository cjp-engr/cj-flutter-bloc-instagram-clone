import 'package:cj_flutter_riverpod_instagram_clone/common/utils/app_theme.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const ProfilePage(),
    );
  }
}
