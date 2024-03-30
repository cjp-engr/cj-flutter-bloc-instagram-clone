import 'package:cj_flutter_riverpod_instagram_clone/common/constants/border_radius.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class UserBioWidget extends StatelessWidget {
  final ImageDetails details;
  const UserBioWidget({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            context.goNamed(
              InstaRouteNames.userDetails,
              pathParameters: {'id': details.userId!},
            );
          },
          child: Row(
            children: [
              const InstaCircleAvatar(
                image: IconRes.testOnly,
                radius: InstaCircleAvatarSize.small,
              ),
              const SizedBox(width: InstaSpacing.extraSmall),
              Column(
                children: [
                  InstaText(text: details.userName!),
                  InstaText(
                    text: details.location ?? '',
                    color: applyColor[InstaColor.disabled],
                  ),
                ],
              ),
            ],
          ),
        ),
        const _DisplayOptionsWidget(),
      ],
    );
  }
}

class _DisplayOptionsWidget extends StatelessWidget {
  const _DisplayOptionsWidget();

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      assetName: IconRes.menuVertical,
      scale: 4,
      onPressed: () async {
        showMaterialModalBottomSheet(
          context: context,
          backgroundColor: applyColor[InstaColor.transparent],
          builder: (context) => SingleChildScrollView(
            controller: ModalScrollController.of(context),
            child: Padding(
              padding: const EdgeInsets.only(
                left: InstaSpacing.tiny,
                right: InstaSpacing.tiny,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: applyColor[InstaColor.primary],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(InstaBorderRadius.small),
                      topRight: Radius.circular(InstaBorderRadius.small),
                    )),
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: InstaSpacing.extraLarge * 4,
                            vertical: InstaSpacing.tiny),
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.white,
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: InstaSpacing.verySmall),
                    _buildOption(asset: IconRes.edit, text: 'Edit'),
                    const Divider(),
                    _buildOption(asset: IconRes.delete, text: 'Delete'),
                    const SizedBox(height: InstaSpacing.small),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildOption({
    required String asset,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.all(InstaSpacing.tiny),
      child: Row(
        children: [
          Image.asset(
            asset,
            scale: 4,
            color: applyColor[InstaColor.tertiary],
          ),
          const SizedBox(width: InstaSpacing.medium),
          InstaText(
            text: text,
          ),
        ],
      ),
    );
  }
}
