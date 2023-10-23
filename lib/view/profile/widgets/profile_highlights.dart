import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:flutter/material.dart';

class ProfileHighlightsWidget extends StatelessWidget {
  const ProfileHighlightsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 44,
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 42,
              child: CircleAvatar(
                backgroundImage: NetworkImage(IconRes.testOnly),
                radius: 40,
              ),
            ),
          ),
          Text('Test Test'),
        ],
      ),
    );
  }
}
