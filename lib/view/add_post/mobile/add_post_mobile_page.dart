import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
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
        InkWell(
          onTap: () {},
          child: const InstaText(
            text: 'Next',
            color: Colors.blue,
          ),
        ),
      ],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: InstaSpacing.verySmall),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: context.screenHeight / 2,
              color: Colors.blue,
            ),
            Column(
              children: [
                const SizedBox(height: InstaSpacing.extraSmall),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(InstaSpacing.verySmall),
                        child: SizedBox(
                          height: InstaSpacing.large,
                          child: InstaButton(
                            buttonType: InstaButtonType.icon,
                            assetName: IconRes.camera,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: InstaSpacing.extraSmall),
                  ],
                ),
                const SizedBox(height: InstaSpacing.extraSmall),
              ],
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.blueAccent,
                  alignment: Alignment.center,
                  child: Text('Item $index'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
