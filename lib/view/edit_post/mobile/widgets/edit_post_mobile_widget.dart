// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/font_size.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/provider/image/images_provider.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/dots_indicator.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/edit_post/controller/edit_post_controller.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/edit_post/provider/edit_post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/alert_dialog.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text_field.dart';
import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';

class EditPostMobileWidget extends ConsumerStatefulWidget {
  const EditPostMobileWidget({super.key});

  @override
  ConsumerState<EditPostMobileWidget> createState() => _EditPostWidgetState();
}

class _EditPostWidgetState extends ConsumerState<EditPostMobileWidget> {
  final PageController pageController = PageController();
  late EditPostController _controller;

  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = EditPostController(ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    final details = ref.watch(editPostProvider).imageDetails;
    _editPostListener();
    return InstaAppBar(
      appBarTitle: const _AppBarWidget(),
      appBarActions: [
        _buildPostButton(),
      ],
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(InstaSpacing.small),
            child: _buildMediaWidget(details!),
          ),
        ],
      ),
    );
  }

  Widget _buildPostButton() {
    final postState = ref.watch(imagesProvider);
    return postState.maybeWhen(
      orElse: () => InkWell(
        onTap: _submit,
        child: InstaText(
          text: 'Update',
          color: applyColor[InstaColor.secondary],
        ),
      ),
      loading: () => CircularProgressIndicator(
        color: applyColor[InstaColor.secondary],
      ),
    );
  }

  Widget _buildMediaWidget(ImageDetails images) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            _buildDisplayMedia(images),
            const SizedBox(height: InstaSpacing.verySmall),
            _buildDotIndicator(images),
            const SizedBox(height: InstaSpacing.verySmall),
          ],
        ),
        const SizedBox(height: InstaSpacing.verySmall),
        _buildDescription(images),
      ],
    );
  }

  Widget _buildDisplayMedia(ImageDetails details) {
    return Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        color: applyColor[InstaColor.primary]!,
      ),
      child: PageView(
        physics: const ClampingScrollPhysics(),
        controller: pageController,
        children: List.generate(details.images!.length, (i) {
          return Stack(
            children: [
              Image.network(
                details.images![i],
                width: double.infinity,
                height: 320,
                fit: BoxFit.cover,
              ),
              _buildRemoveButton(details, details.images![i]),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildDotIndicator(ImageDetails details) {
    return details.images!.length == 1
        ? const SizedBox()
        : InstaDotsIndicator(
            controller: pageController,
            count: details.images!.length,
          );
  }

  Widget _buildDescription(ImageDetails details) {
    return InstaTextField(
      label: 'Write Something',
      maxLines: 4,
      controller: _descriptionController,
      initialValue: details.description ?? '',
      color: applyColor[InstaColor.transparent],
      onChanged: (value) {
        _descriptionController.text = value;
      },
    );
  }

  Widget _buildRemoveButton(ImageDetails details, String url) {
    return InkWell(
      onTap: () {
        _controller.removeMedia(details, url);
      },
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(InstaSpacing.extraSmall),
          child: Image.asset(
            IconRes.delete,
            color: applyColor[InstaColor.alert],
            scale: 3.5,
          ),
        ),
      ),
    );
  }

  void _editPostListener() {
    ref.listen<AsyncValue<void>>(
      imagesProvider,
      (prev, next) {
        next.whenOrNull(
          data: (data) {
            context.goNamed(InstaRouteNames.home);
          },
          error: (e, st) {
            showAlertDialog(
              context,
              title: e.toString(),
              buttonCancelText: 'OK',
            );
          },
          loading: () => const CircularProgressIndicator(),
        );
      },
    );
  }

  void _submit() {
    _controller.updateImages();
  }
}

class _AppBarWidget extends StatelessWidget {
  const _AppBarWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SecondaryButton(
          assetName: IconRes.back,
          scale: 4,
          onPressed: () => context.goNamed(InstaRouteNames.profile),
        ),
        const SizedBox(width: InstaSpacing.verySmall),
        const InstaText(
          text: 'Edit Post',
          fontSize: InstaFontSize.large,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
