import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

class NameAndDescriptionWidget extends StatelessWidget {
  const NameAndDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDisplayName(),
            const SizedBox(height: InstaSpacing.medium),
            _buildDescription(),
            const SizedBox(height: InstaSpacing.small),
          ],
        ),
        const SizedBox(),
      ],
    );
  }

  Widget _buildDisplayName() {
    return const InstaText(
      text: 'First Name Last Name',
      fontWeight: FontWeight.bold,
    );
  }

  Widget _buildDescription() {
    return const InstaText(text: 'Description Lorem Ipsum');
  }
}
