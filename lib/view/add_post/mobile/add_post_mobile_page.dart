import 'dart:io';

import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/add_post/mobile/widgets/add_post_test.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:video_player/video_player.dart';

class AddPostMobilePage extends StatefulWidget {
  const AddPostMobilePage({super.key});

  @override
  State<AddPostMobilePage> createState() => _AddPostMobilePageState();
}

class _AddPostMobilePageState extends State<AddPostMobilePage> {
  List<XFile>? _mediaFileList;
  final ImagePicker _picker = ImagePicker();
  dynamic _pickImageError;

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
                        _onImageButtonPressed(ImageSource.gallery,
                            context: context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: InstaSpacing.verySmall),
              ],
            ),
            _previewImages(),
          ],
        ),
      ),
    );
  }

  Widget _previewImages() {
    if (_mediaFileList != null) {
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
          itemCount: _mediaFileList!.length,
          itemBuilder: (context, index) {
            final mime = lookupMimeType(_mediaFileList![index].path);
            return Semantics(
              label: 'image_picker_example_picked_image',
              child: (mime == null || mime.startsWith('image/')
                  ? Image.file(
                      File(_mediaFileList![index].path),
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return const Center(
                            child: Text('This image type is not supported'));
                      },
                    )
                  : _buildInlineVideoPlayer(index)),
            );
          },
        ),
      );
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _buildInlineVideoPlayer(int index) {
    final VideoPlayerController controller =
        VideoPlayerController.file(File(_mediaFileList![index].path));
    controller.initialize();
    controller.setLooping(true);
    controller.play();
    return Center(child: AspectRatioVideo(controller));
  }

  Future<void> _onImageButtonPressed(
    ImageSource source, {
    required BuildContext context,
  }) async {
    if (context.mounted) {
      try {
        final pickedFileList = await _picker.pickMultipleMedia();
        setState(() {
          _mediaFileList = pickedFileList;
        });
      } catch (e) {
        setState(() {
          _pickImageError = e;
        });
      }
    }
  }
}
