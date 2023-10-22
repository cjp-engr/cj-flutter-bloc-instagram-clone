import 'package:cj_flutter_riverpod_instagram_clone/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/buttons.dart';
import 'package:flutter/material.dart';

class InstaBottomNavBar extends StatelessWidget {
  const InstaBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InstaButton(
            assetName: IconRes.home,
            buttonType: EButtonType.icon,
            onPressed: () {},
          ),
          InstaButton(
            assetName: IconRes.newPost,
            buttonType: EButtonType.icon,
            onPressed: () {},
          ),
          InstaButton(
            assetName: IconRes.messenger,
            buttonType: EButtonType.icon,
            onPressed: () {},
          ),
          _profileIcon()
        ],
      ),
    );
  }

  Widget _profileIcon() {
    return InkWell(
      onTap: () {},
      child: const CircleAvatar(
        backgroundColor: Colors.white,
        radius: 21,
        child: CircleAvatar(
          backgroundImage: NetworkImage(IconRes.testOnly),
          radius: 18,
        ),
      ),
    );
  }
}
