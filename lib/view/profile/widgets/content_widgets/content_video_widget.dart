import 'package:flutter/material.dart';

class ContentVideoWidget extends StatelessWidget {
  const ContentVideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildContentVideo();
  }

  Widget _buildContentVideo() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.yellow,
          alignment: Alignment.center,
          child: Text('Item $index'),
        );
      },
    );
  }
}
