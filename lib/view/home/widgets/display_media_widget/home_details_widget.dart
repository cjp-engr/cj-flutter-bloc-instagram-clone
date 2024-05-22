import 'package:cj_flutter_riverpod_instagram_clone/common/constants/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/image/display_images_provider.dart';

import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/media_content_widget/bio_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/media_content_widget/details_block_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/media_content_widget/media_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/profile/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDetailsWidget extends ConsumerStatefulWidget {
  const HomeDetailsWidget({super.key});

  @override
  ConsumerState<HomeDetailsWidget> createState() => HomeDetailsWidgetState();
}

class HomeDetailsWidgetState extends ConsumerState<HomeDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    //TODO: display all the images that the user follows
    final image = ref.watch(displayImagesProvider);
    final viewIndex = ref.watch(profileProvider).scrollToIndex;
    return Material(
      child: Column(
        children: <Widget>[
          AppBar(
            title: _AppBarWidget(title: AppLocalizations.of(context)!.appTitle),
          ),
          image.isLoading
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: InstaSpacing.verySmall),
                  child: LinearProgressIndicator(
                    minHeight: 2,
                    color: applyColor[InstaColor.secondary],
                  ),
                )
              : const SizedBox(),
          image.when(
            data: (details) {
              return Expanded(
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
                        BioWidget(details: details![index]),
                        const SizedBox(height: InstaSpacing.extraSmall),
                        MediaWidget(images: details[index].images!),
                        const SizedBox(height: InstaSpacing.medium),
                        DetailsBlockWidget(details: details[index]),
                        const SizedBox(height: InstaSpacing.medium),
                      ],
                    ),
                  ),
                ),
              );
            },
            error: (error, stackTrace) {
              return const Text('there is an error');
            },
            loading: () => const SizedBox(),
          ),
        ],
      ),
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
    return InstaText(
      text: title,
      fontSize: InstaFontSize.large,
      fontWeight: FontWeight.bold,
    );
  }
}
