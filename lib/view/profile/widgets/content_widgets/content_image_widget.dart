import 'package:cj_flutter_riverpod_instagram_clone/view/profile/provider/display_images_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContentImageWidget extends ConsumerWidget {
  const ContentImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(displayImagesProvider);

    return image.when(
      data: (data) {
        String imageUrl = '';
        if (data?.isNotEmpty ?? false) {
          for (var element in data!) {
            print(element);
          }
        }
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: image.value?.length ?? 0,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              child: Text(imageUrl),
            );
          },
        );
      },
      error: (error, stackTrace) {
        return const Text('there is an error');
      },
      loading: () => const CircularProgressIndicator(),
    );
  }
}
