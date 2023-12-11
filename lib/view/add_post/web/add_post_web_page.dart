import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class AddPostWebPage extends StatelessWidget {
  const AddPostWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InstaAppBar(
      appBarTitle: Breakpoints.mediumAndUp.isActive(context)
          ? const SizedBox()
          : const InstaText(
              text: 'Instaclone',
              fontSize: InstaFontSize.veryLarge,
              fontWeight: FontWeight.bold,
            ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: InstaSpacing.veryLarge * 4),
            const InstaText(
              text: 'Create new post',
              fontSize: InstaFontSize.large,
            ),
            const SizedBox(height: InstaSpacing.large),
            Image.asset(
              IconRes.camera,
              color: Colors.white,
            ),
            const InstaText(
              text: 'Drag photos and videos here',
              fontSize: InstaFontSize.veryLarge,
            ),
            const SizedBox(height: InstaSpacing.large),
            InstaButton(
              buttonType: InstaButtonType.secondary,
              width: 220,
              height: 40,
              text: 'Select from Computer',
              onPressed: () async {
                var picked = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowMultiple: true,
                  allowCompression: false,
                  allowedExtensions: [
                    'bmp',
                    'gif',
                    'jpeg',
                    'jpg',
                    'png',
                    'heic',
                    'avi',
                    'flv',
                    'mkv',
                    'mov',
                    'mp4',
                    'mpeg',
                    'webm',
                    'wmv'
                  ],
                );

                if (picked != null) {}
              },
            ),
          ],
        ),
      ),
    );
  }
}
