import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/mobile/widgets/add_post_button_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/mobile/widgets/preview_image_list_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/mobile/widgets/preview_selected_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPostMobilePage extends ConsumerWidget {
  const AddPostMobilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InstaAppBar(
      appBarTitle: const InstaText(
        text: 'New Post',
        fontSize: InstaFontSize.large,
        fontWeight: FontWeight.bold,
      ),
      appBarActions: [
        _buildNextButton(),
      ],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.padding),
        child: const Column(
          children: [
            PreviewSelectedImageWidget(),
            AddPostButtonWidget(),
            PreviewImageListWidget(),
          ],
        ),
      ),
      floatingActionButton: _buildDeleteButton(),
    );
  }

  Widget _buildDeleteButton() {
    return InstaButton(
      buttonType: InstaButtonType.icon,
      assetName: IconRes.delete,
      color: Colors.red,
      iconScale: 2,
      onPressed: () {},
    );
  }

  Widget _buildNextButton() {
    return InkWell(
      onTap: () {},
      child: const InstaText(
        text: 'Next',
        color: Colors.blue,
      ),
    );
  }
}
