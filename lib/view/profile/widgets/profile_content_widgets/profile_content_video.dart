import 'package:flutter/material.dart';

class ProfileContentVideoWidget extends StatelessWidget {
  const ProfileContentVideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blueAccent,
          alignment: Alignment.center,
          child: Text('Item $index'),
        );
      },
    );
  }
}
