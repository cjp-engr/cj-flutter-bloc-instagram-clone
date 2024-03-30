// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/routes_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/media_content_widget/actions_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/media_content_widget/details_block_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/media_content_widget/media_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/media_content_widget/bio_widget.dart';
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
      return const _UserDetailsWidget();
    } else {
      return const _HomeDetailsWidget();
    }
  }
}

class _UserDetailsWidget extends ConsumerWidget {
  const _UserDetailsWidget();

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BioWidget(details: details![index]),
                    ActionsWidget(details: details[index]),
                  ],
                ),
                const SizedBox(height: InstaSpacing.extraSmall),
                MediaWidget(images: details[index].images!),
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

class _HomeDetailsWidget extends StatelessWidget {
  const _HomeDetailsWidget();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
