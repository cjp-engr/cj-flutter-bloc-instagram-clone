import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/messaging_list/widgets/messaging_list_user.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/messaging_list/widgets/messaging_note.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/messaging_list/widgets/messaging_search.dart';
import 'package:flutter/material.dart';

class MessagingListPage extends StatelessWidget {
  const MessagingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InstaAppBar(
      appBarActions: [
        InstaButton(
          buttonType: InstaButtonType.icon,
          assetName: IconRes.writeMessage,
          onPressed: () {},
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
                MessagingSearch(),
                SizedBox(height: InstaSpacing.medium),
                MessagingNote(),
                SizedBox(height: InstaSpacing.medium),
                MessagingList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
