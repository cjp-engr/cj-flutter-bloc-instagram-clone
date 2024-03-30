import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/image/images_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/modal_bottom_sheet.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActionsWidget extends StatelessWidget {
  final ImageDetails details;
  const ActionsWidget({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      assetName: IconRes.menuVertical,
      scale: 4,
      onPressed: () async =>
          showCustomBottomSheet(context, widget: _buildOptions()),
    );
  }

  Widget _buildOptions() {
    return Column(
      children: [
        const SizedBox(height: InstaSpacing.verySmall),
        _OptionWidget(
          asset: IconRes.edit,
          text: 'Edit',
          details: details,
        ),
        const Divider(),
        _OptionWidget(
          asset: IconRes.delete,
          text: 'Delete',
          details: details,
          isDelete: true,
        ),
        const SizedBox(height: InstaSpacing.small),
      ],
    );
  }
}

class _OptionWidget extends ConsumerWidget {
  final String asset;
  final String text;
  final ImageDetails details;
  final bool isDelete;
  const _OptionWidget({
    required this.asset,
    required this.text,
    required this.details,
    this.isDelete = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color? color = isDelete
        ? applyColor[InstaColor.alert]
        : applyColor[InstaColor.tertiary];
    return InkWell(
      onTap: () async {
        ref.read(imagesProvider.notifier).deleteImages(details.imagesId ?? '');
      },
      child: Padding(
        padding: const EdgeInsets.all(InstaSpacing.tiny),
        child: Row(
          children: [
            Image.asset(
              asset,
              scale: 4,
              color: color,
            ),
            const SizedBox(width: InstaSpacing.medium),
            InstaText(
              text: text,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
