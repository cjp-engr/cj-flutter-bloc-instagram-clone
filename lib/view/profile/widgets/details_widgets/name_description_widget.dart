import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/user/display_user_details_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NameAndDescriptionWidget extends ConsumerWidget {
  const NameAndDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(displayUserDetailsProvider);
    return user.when(
      data: (data) {
        return Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDisplayName(data?.fullName ?? ''),
                const SizedBox(height: InstaSpacing.medium),
                _buildDescription(data?.description ?? ''),
                const SizedBox(height: InstaSpacing.small),
              ],
            ),
            const SizedBox(),
          ],
        );
      },
      error: (error, stackTrace) => const Text('there is an error'),
      loading: () => const CircularProgressIndicator(),
    );
  }

  Widget _buildDisplayName(String name) {
    return InstaText(
      text: name,
      fontWeight: FontWeight.bold,
    );
  }

  Widget _buildDescription(String description) {
    return InstaText(text: description);
  }
}
