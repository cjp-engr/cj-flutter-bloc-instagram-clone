import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/controller/add_post_controller.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/mobile/widgets/preview_media_list_widget.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPostMobilePage extends ConsumerStatefulWidget {
  const AddPostMobilePage({super.key});

  @override
  ConsumerState<AddPostMobilePage> createState() => _AddPostMobilePageState();
}

class _AddPostMobilePageState extends ConsumerState<AddPostMobilePage> {
  late AddPostController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AddPostController(ref: ref);
  }

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
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: context.screenHeight / 2.3,
              color: Colors.blue,
            ),
            Column(
              children: [
                const SizedBox(height: InstaSpacing.verySmall),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCameraButton(),
                    _buildGalleryButton(),
                  ],
                ),
                const SizedBox(height: InstaSpacing.verySmall),
              ],
            ),
            const PreviewMediaListWidget(),
          ],
        ),
      ),
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

  Widget _buildCameraButton() {
    return const InstaButton(
      buttonType: InstaButtonType.tertiary,
      text: 'Camera',
      assetName: IconRes.camera,
    );
  }

  Widget _buildGalleryButton() {
    return InstaButton(
      buttonType: InstaButtonType.tertiary,
      text: 'Gallery',
      assetName: IconRes.gallery,
      onPressed: () {
        _controller.selectMedia();
      },
    );
  }

  List<XFile>? get mediaFileList =>
      ref.watch(addPostNotifierProvider).mediaFileList;
}
