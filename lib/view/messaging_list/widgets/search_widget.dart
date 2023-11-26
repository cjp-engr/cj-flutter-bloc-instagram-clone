import 'package:cj_flutter_riverpod_instagram_clone/common/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String search = '';
  @override
  Widget build(BuildContext context) {
    return _buildSearch();
  }

  Widget _buildSearch() => InstaTextField(
        label: 'Search',
        prefixIcon: const Icon(Icons.search),
        onChanged: (text) => search = text,
      );
}
