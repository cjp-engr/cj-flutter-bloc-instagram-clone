import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/display_media_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserHomePage extends ConsumerWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const DisplayMediaWidget();
  }
}
