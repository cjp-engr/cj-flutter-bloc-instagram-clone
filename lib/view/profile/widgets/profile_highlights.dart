import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

class ProfileHighlightsWidget extends StatelessWidget {
  const ProfileHighlightsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _highlights('Test Test', false),
        const SizedBox(width: 10),
        _highlights('New', true),
      ],
    );
  }

  Widget _highlights(String text, bool isAdd) {
    return InkWell(
      onTap: () {},
      splashFactory: NoSplash.splashFactory,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 44,
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 42,
              child: isAdd
                  ? const Icon(
                      Icons.add,
                      size: 50,
                    )
                  : const CircleAvatar(
                      backgroundImage: NetworkImage(IconRes.testOnly),
                      radius: 40,
                    ),
            ),
          ),
          const SizedBox(height: InstaSpacing.tiny),
          InstaText(text: text)
        ],
      ),
    );
  }
}
