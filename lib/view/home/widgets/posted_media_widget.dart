// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/routes_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/dots_indicator.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/like_comment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/image/display_images_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';

class PostedMediaWidget extends ConsumerWidget {
  const PostedMediaWidget({super.key});

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
      data: (data) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: data?.length ?? 0,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                const _UsernameAndLocationWidget(),
                const SizedBox(height: InstaSpacing.extraSmall),
                _ContentMediaWidget(
                  data: data!,
                  index: index,
                ),
                const SizedBox(height: InstaSpacing.extraSmall),
                const _IconsWidget(),
                const SizedBox(height: InstaSpacing.medium),
                const LikeAndCommentWidget(),
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

class _UsernameAndLocationWidget extends StatelessWidget {
  const _UsernameAndLocationWidget();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(
          InstaRouteNames.userDetails,
          pathParameters: {'id': '1'},
        );
      },
      child: Row(
        children: [
          const InstaCircleAvatar(
            image: IconRes.testOnly,
            radius: InstaCircleAvatarSize.small,
          ),
          const SizedBox(width: InstaSpacing.extraSmall),
          Column(
            children: [
              const InstaText(text: 'user_name'),
              InstaText(
                text: 'Afghanistan',
                color: applyColor[InstaColor.disabled],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContentMediaWidget extends StatelessWidget {
  final List<ImageDetails> data;
  final int index;
  const _ContentMediaWidget({
    required this.data,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 300.0,
          decoration: BoxDecoration(
            color: applyColor[InstaColor.primary]!,
          ),
          child: PageView(
            physics: const ClampingScrollPhysics(),
            controller: pageController,
            children: List.generate(data[index].images!.length, (i) {
              return Image.network(
                data[index].images![i],
                width: double.infinity,
                height: 320,
                fit: BoxFit.cover,
              );
            }),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(InstaSpacing.tiny),
              child: InstaDotsIndicator(
                controller: pageController,
                dotSize: InstaSpacing.tiny,
                count: data[index].images?.length ?? 0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _IconsWidget extends StatelessWidget {
  const _IconsWidget();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SecondaryButton(
          assetName: IconRes.heart,
        ),
        SizedBox(width: InstaSpacing.small),
        SecondaryButton(
          assetName: IconRes.saved,
        ),
      ],
    );
  }
}
