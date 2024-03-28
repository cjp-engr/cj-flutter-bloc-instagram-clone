import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/enums/color.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/dots_indicator.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/widgets/media_content_widget.dart/icons_widget.dart';
import 'package:flutter/material.dart';

class MediaWidget extends StatelessWidget {
  final List<String> images;
  const MediaWidget({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 300.0,
          decoration: BoxDecoration(
            color: applyColor[InstaColor.primary]!,
          ),
          child: PageView(
            physics: const ClampingScrollPhysics(),
            controller: pageController,
            children: List.generate(images.length, (i) {
              return Image.network(
                images[i],
                width: double.infinity,
                height: 320,
                fit: BoxFit.cover,
              );
            }),
          ),
        ),
        const SizedBox(height: 335.0),
        const Positioned.fill(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: IconsWidget(),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: InstaSpacing.medium),
              child: images.length <= 1
                  ? const SizedBox()
                  : InstaDotsIndicator(
                      controller: pageController,
                      count: images.length,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
