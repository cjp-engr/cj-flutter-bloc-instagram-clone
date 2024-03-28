import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsBlockWidget extends StatefulWidget {
  final ImageDetails details;
  const DetailsBlockWidget({
    super.key,
    required this.details,
  });

  @override
  State<DetailsBlockWidget> createState() => _DetailsBlockWidgetState();
}

class _DetailsBlockWidgetState extends State<DetailsBlockWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLike(),
        _buildUserName(),
        _buildDescription(),
        _buildViewComment(),
        const SizedBox(height: InstaSpacing.extraSmall),
        _buildAddComment(),
      ],
    );
  }

  Widget _buildLike() {
    return InstaText(text: AppLocalizations.of(context)!.likesCount(1234));
  }

  Widget _buildUserName() {
    return InstaText(text: widget.details.userName!);
  }

  Widget _buildDescription() {
    return InstaText(
        text: widget.details.description!, textAlign: TextAlign.start);
  }

  Widget _buildViewComment() {
    return InkWell(
        child: InstaText(
            text: AppLocalizations.of(context)!.viewAllCountComment(3000)),
        onTap: () {});
  }

  Widget _buildAddComment() {
    return Row(
      children: [
        _displayAvatar(),
        const SizedBox(width: InstaSpacing.extraSmall),
        _displayAddComment(),
      ],
    );
  }

  Widget _displayAvatar() {
    return const InstaCircleAvatar(
      image: IconRes.testOnly,
      radius: InstaCircleAvatarSize.small,
    );
  }

  Widget _displayAddComment() {
    return InkWell(
      child: InstaText(
        text: AppLocalizations.of(context)!.addAComment,
        color: applyColor[InstaColor.disabled],
      ),
      onTap: () {},
    );
  }
}
