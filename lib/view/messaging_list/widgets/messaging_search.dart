import 'package:cj_flutter_riverpod_instagram_clone/common/constants/border_radius.dart';
import 'package:cj_flutter_riverpod_instagram_clone/common/constants/spacing.dart';
import 'package:flutter/material.dart';

class MessagingSearch extends StatelessWidget {
  const MessagingSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(vertical: InstaSpacing.verySmall),
        prefixIcon: Icon(Icons.search),
        labelText: 'Search',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(InstaBorderRadius.small),
          ),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(InstaBorderRadius.small),
          ),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
