import 'dart:io';

import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/controller/add_post_controller.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/notifier/add_post_notifier.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/widget/video_player_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
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
  void dispose() {
    super.dispose();
    _controller.disposeVideoController();
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
        InkWell(
          onTap: () {},
          child: const InstaText(
            text: 'Next',
            color: Colors.blue,
          ),
        ),
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
                    const InstaButton(
                      buttonType: InstaButtonType.tertiary,
                      text: 'Camera',
                      assetName: IconRes.camera,
                    ),
                    InstaButton(
                      buttonType: InstaButtonType.tertiary,
                      text: 'Gallery',
                      assetName: IconRes.gallery,
                      onPressed: () {
                        _controller.selectMedia();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: InstaSpacing.verySmall),
              ],
            ),
            // !kIsWeb && defaultTargetPlatform == TargetPlatform.android
            //     ? FutureBuilder<void>(
            //         future: _controller.retrieveLostData(),
            //         builder:
            //             (BuildContext context, AsyncSnapshot<void> snapshot) {
            //           switch (snapshot.connectionState) {
            //             case ConnectionState.none:
            //             case ConnectionState.waiting:
            //               return const Text(
            //                 'You have not yet picked an image.',
            //                 textAlign: TextAlign.center,
            //               );
            //             case ConnectionState.done:
            //               if (snapshot.hasData) {
            //                 return _buildPreviewMedia();
            //               } else {
            //                 return const SizedBox();
            //               }

            //             case ConnectionState.active:
            //               if (snapshot.hasError) {
            //                 return Text(
            //                   'Pick image/video error: ${snapshot.error}}',
            //                   textAlign: TextAlign.center,
            //                 );
            //               } else {
            //                 return const Text(
            //                   'You have not yet picked an image.',
            //                   textAlign: TextAlign.center,
            //                 );
            //               }
            //           }
            //         },
            //       )
            //     :
            _buildPreviewMedia(),
          ],
        ),
      ),
    );
  }

  Widget _buildPreviewMedia() {
    if (mediaFileList != null) {
      return Semantics(
        label: 'image_picker_example_picked_images',
        child: GridView.builder(
          key: UniqueKey(),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: mediaFileList?.length,
          itemBuilder: (context, index) {
            final mime = lookupMimeType(mediaFileList![index].path);
            return Semantics(
              label: 'image_picker_example_picked_image',
              child: (mime == null || mime.startsWith('image/')
                  ? Image.file(
                      File(mediaFileList![index].path),
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return const Center(
                            child: Text('This image type is not supported'));
                      },
                    )
                  : VideoPlayerWidget(index)),
            );
          },
        ),
      );
    } else {
      return const Text(
        'You have not yet picked an imagehello.',
        textAlign: TextAlign.center,
      );
    }
  }

  List<XFile>? get mediaFileList =>
      ref.watch(addPostNotifierProvider).mediaFileList;
}
