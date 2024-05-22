import 'package:cj_flutter_riverpod_instagram_clone/common/constants/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/image/display_images_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/media_content_widget/actions_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/media_content_widget/bio_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/media_content_widget/details_block_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/media_content_widget/media_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class UserDetailsWidget extends ConsumerStatefulWidget {
  const UserDetailsWidget({super.key});

  @override
  ConsumerState<UserDetailsWidget> createState() => UserDetailsWidgetState();
}

class UserDetailsWidgetState extends ConsumerState<UserDetailsWidget> {
  final ItemScrollController scrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    final image = ref.watch(displayImagesProvider);
    final viewIndex = ref.watch(profileProvider).scrollToIndex;

    return image.when(
      data: (details) {
        return Material(
          child: Column(
            children: <Widget>[
              AppBar(
                title: const _AppBarWidget(title: 'Your Posts'),
              ),
              Expanded(
                child: ScrollablePositionedList.builder(
                  initialScrollIndex: viewIndex ?? 0,
                  itemCount: details?.length ?? 0,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: InstaSpacing.verySmall),
                    child: Column(
                      key: ValueKey(index),
                      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return const Text('there is an error');
      },
      loading: () => const CircularProgressIndicator(),
    );
  }
}

class _AppBarWidget extends StatelessWidget {
  final String title;

  const _AppBarWidget({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            SecondaryButton(
              assetName: IconRes.back,
              scale: 4,
              onPressed: () => context.goNamed(InstaRouteNames.profile),
            ),
            const SizedBox(width: InstaSpacing.verySmall),
          ],
        ),
        InstaText(
          text: title,
          fontSize: InstaFontSize.large,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
