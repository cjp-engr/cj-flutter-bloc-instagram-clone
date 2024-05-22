import 'package:cj_flutter_riverpod_instagram_clone/common/constants/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/media_content_widget/add_comment_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsBlockWidget extends ConsumerStatefulWidget {
  final ImageDetails details;
  const DetailsBlockWidget({
    super.key,
    required this.details,
  });

  @override
  ConsumerState<DetailsBlockWidget> createState() => _DetailsBlockWidgetState();
}

class _DetailsBlockWidgetState extends ConsumerState<DetailsBlockWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLike(),
        _buildDescription(),
        widget.details.description!.isEmpty
            ? const SizedBox()
            : const SizedBox(height: InstaSpacing.extraSmall),
        _buildViewComment(),
        const SizedBox(height: InstaSpacing.extraSmall),
        const AddCommentWidget(),
      ],
    );
  }

  Widget _buildLike() {
    return InstaText(text: AppLocalizations.of(context)!.likesCount(1234));
  }

  Widget _buildDescription() {
    return widget.details.description!.isEmpty
        ? const SizedBox()
        : Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: widget.details.userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: InstaFontSize.medium,
                  ),
                ),
                const TextSpan(text: ' '),
                TextSpan(
                    text: widget.details.description,
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
