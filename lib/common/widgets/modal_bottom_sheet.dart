// import 'package:flutter/material.dart';

import 'package:cj_flutter_riverpod_instagram_clone/common/constants/border_radius.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<void> showCustomBottomSheet(
  BuildContext context, {
  required Widget widget,
}) {
  return showMaterialModalBottomSheet(
    context: context,
    backgroundColor: applyColor[InstaColor.transparent],
    useRootNavigator: true,
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
              widget
            ],
          ),
        ),
      ),
    ),
  );
}
