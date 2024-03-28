// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/routes_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/media_content_widget.dart/details_block_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/media_content_widget.dart/media_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/media_content_widget.dart/user_bio_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/image/display_images_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';

class DisplayMediaWidget extends ConsumerWidget {
  const DisplayMediaWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    if (router.routeInformationProvider.value.uri.toString() ==
        '/${InstaRouteNames.userHomePage}') {
      return const _OwnerDetailsWidget();
    } else {
      return const SizedBox();
    }
  }
}

class _OwnerDetailsWidget extends ConsumerWidget {
  const _OwnerDetailsWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(displayImagesProvider);
    return image.when(
      data: (details) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: details?.length ?? 0,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                const UserBioWidget(),
                const SizedBox(height: InstaSpacing.extraSmall),
                MediaWidget(images: details![index].images!),
                const SizedBox(height: InstaSpacing.medium),
                DetailsBlockWidget(details: details[index]),
                const SizedBox(height: InstaSpacing.medium),
              ],
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
