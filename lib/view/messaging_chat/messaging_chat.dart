import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/messaging_chat/widgets/chat_details_status.dart';

import 'package:flutter/material.dart';

class MessagingChatPage extends StatelessWidget {
  const MessagingChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InstaAppBar(
      appBarTitle: const ChatDetailsStatus(),
      body: const InstaText(text: 'Messaging Chat Body!!!'),
    );
  }
}
