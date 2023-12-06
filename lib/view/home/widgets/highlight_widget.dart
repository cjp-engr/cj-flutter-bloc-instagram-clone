import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HighlightWidget extends StatelessWidget {
  const HighlightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const InstaCircleAvatar(image: IconRes.testOnly),
        const SizedBox(height: InstaSpacing.tiny),
        InstaText(text: AppLocalizations.of(context)!.yourStory)
      ],
    );
  }
}
