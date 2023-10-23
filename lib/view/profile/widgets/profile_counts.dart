import 'package:flutter/material.dart';

class ProfileCountsWidget extends StatelessWidget {
  const ProfileCountsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Text('25'),
                  Text('posts'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Text('4'),
                  Text('followers'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Text('54'),
                  Text('following'),
                ],
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
