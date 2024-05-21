import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/image/display_images_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ContentImageWidget extends ConsumerStatefulWidget {
  const ContentImageWidget({super.key});

  @override
  ConsumerState<ContentImageWidget> createState() => _ContentImageWidgetState();
}

class _ContentImageWidgetState extends ConsumerState<ContentImageWidget> {
  @override
  Widget build(BuildContext context) {
    final images = ref.watch(displayImagesProvider);
    final controller = ProfileController(ref: ref);
    return images.isLoading
        ? const CircularProgressIndicator()
        : images.when(
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
                    onTap: () {
                      context.goNamed(InstaRouteNames.userHomePage);
                      controller.getMediaIndexToView(index);
                    },
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.network(
                            data![index].images?[0] ?? IconRes.testOnly,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding:
                                const EdgeInsets.all(InstaSpacing.extraSmall),
                            child: data[index].images?.length == 1
                                ? const SizedBox()
                                : Image.asset(
                                    IconRes.stack,
                                    color: applyColor[InstaColor.tertiary],
                                    scale: 3.5,
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
