import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/mobile/widgets/add_post_button_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/mobile/widgets/preview_image_list_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/mobile/widgets/preview_selected_image_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/mobile/widgets/remove_post_widget.dart';
import 'package:flutter/material.dart';

class AddPostMobilePage extends StatelessWidget {
  const AddPostMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
      floatingActionButton: const RemovePostWidget(),
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
