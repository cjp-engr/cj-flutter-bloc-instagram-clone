import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

class CountsWidget extends StatelessWidget {
  const CountsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: InstaSpacing.tiny),
            _buildCount(count: '25', text: 'posts'),
            const SizedBox(width: InstaSpacing.tiny),
            _buildCount(count: '4', text: 'followers'),
            const SizedBox(width: InstaSpacing.tiny),
            _buildCount(count: '54', text: 'following'),
            const SizedBox(width: InstaSpacing.tiny),
          ],
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildCount({
    required String count,
    required String text,
  }) {
    return Column(
      children: [
        InstaText(
          text: count,
          fontWeight: FontWeight.bold,
        ),
        InstaText(
          text: text,
          color: Colors.grey,
        ),
      ],
    );
  }
}
