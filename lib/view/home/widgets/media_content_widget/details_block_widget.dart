import 'package:cj_flutter_riverpod_instagram_clone/common/constants/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/provider/home_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/media_content_widget/add_comment_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsBlockWidget extends ConsumerStatefulWidget {
  const DetailsBlockWidget({super.key});

  @override
  ConsumerState<DetailsBlockWidget> createState() => _DetailsBlockWidgetState();
}

class _DetailsBlockWidgetState extends ConsumerState<DetailsBlockWidget> {
  @override
  Widget build(BuildContext context) {
    final details = ref.watch(homeProvider).imageDetails;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLike(),
        _buildDescription(),
        details!.description!.isEmpty
            ? const SizedBox()
            : const SizedBox(height: InstaSpacing.extraSmall),
        _buildViewComment(),
        const SizedBox(height: InstaSpacing.extraSmall),
        AddCommentWidget(details: details),
      ],
    );
  }

  Widget _buildLike() {
    return InstaText(text: AppLocalizations.of(context)!.likesCount(1234));
  }

  Widget _buildDescription() {
    final details = ref.watch(homeProvider).imageDetails;
    return details!.description!.isEmpty
        ? const SizedBox()
        : Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: details.userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: InstaFontSize.medium,
                  ),
                ),
                const TextSpan(text: ' '),
                TextSpan(
                    text: details.description,
                    style: const TextStyle(
                      fontSize: InstaFontSize.medium,
                    )),
              ],
            ),
            textAlign: TextAlign.start,
          );
  }

  Widget _buildViewComment() {
    return InkWell(
        child: InstaText(
            text: AppLocalizations.of(context)!.viewAllCountComment(3000)),
        onTap: () {});
  }
}
