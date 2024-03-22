import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/image/display_images_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ContentImageWidget extends ConsumerWidget {
  const ContentImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(displayImagesProvider);

    return image.when(
      data: (data) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: data?.length ?? 0,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => context.goNamed(InstaRouteNames.userHomePage),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.network(
                      data![index].images![0],
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(InstaSpacing.extraSmall),
                        child: data[index].images?.length == 1
                            ? const SizedBox()
                            : Image.asset(
                                IconRes.stack,
                                color: applyColor[InstaColor.tertiary],
                                scale: 3.5,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
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
