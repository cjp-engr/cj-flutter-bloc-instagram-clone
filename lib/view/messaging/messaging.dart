import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/messaging/widgets/messaging_list.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/messaging/widgets/messaging_note.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/messaging/widgets/messaging_search.dart';
import 'package:flutter/material.dart';

class MessagingPage extends StatelessWidget {
  const MessagingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InstaAppBar(
      appBarActions: const [
        InstaButton(
          buttonType: InstaButtonType.icon,
          assetName: IconRes.writeMessage,
        ),
      ],
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: InstaSpacing.verySmall),
          child: TapRegion(
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MessagingSearchWidget(),
                SizedBox(height: InstaSpacing.medium),
                MessagingNoteWidget(),
                SizedBox(height: InstaSpacing.medium),
                MessagingListWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
