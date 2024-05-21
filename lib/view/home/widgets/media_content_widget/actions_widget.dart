import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/image/display_images_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/modal_bottom_sheet.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/edit_post/provider/edit_post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ActionsWidget extends ConsumerStatefulWidget {
  final ImageDetails details;
  const ActionsWidget({super.key, required this.details});

  @override
  ConsumerState<ActionsWidget> createState() => _ActionsWidgetState();
}

class _ActionsWidgetState extends ConsumerState<ActionsWidget> {
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
          details: widget.details,
          onTap: () async {
            Navigator.pop(context);
            context.goNamed(InstaRouteNames.editPost,
                pathParameters: {'id': widget.details.imagesId!});
            ref.read(editPostProvider.notifier).displayImages(widget.details);
          },
        ),
        const Divider(),
        _OptionWidget(
          asset: IconRes.delete,
          text: 'Delete',
          details: widget.details,
          isDelete: true,
          onTap: () async {
            Navigator.pop(context);
            ref
                .read(displayImagesProvider.notifier)
                .deleteImages(widget.details.imagesId ?? '');
          },
        ),
        const SizedBox(height: InstaSpacing.small),
      ],
    );
  }
}

class _OptionWidget extends StatelessWidget {
  final String asset;
  final String text;
  final ImageDetails details;
  final bool isDelete;
  final Function()? onTap;
  const _OptionWidget({
    required this.asset,
    required this.text,
    required this.details,
    this.isDelete = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color? color = isDelete
        ? applyColor[InstaColor.alert]
        : applyColor[InstaColor.tertiary];
    return InkWell(
      onTap: () async {
        onTap!();
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
