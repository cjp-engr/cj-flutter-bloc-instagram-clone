import 'package:cj_flutter_riverpod_instagram_clone/model/image/image_details.dart';
import 'package:cj_flutter_riverpod_instagram_clone/view/home/provider/home_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeController {
  final WidgetRef ref;

  HomeController({required this.ref});

  Future<void> displayImageDetails(ImageDetails details) async {
    final homeState = ref.read(homeProvider.notifier);
    homeState.getImageDetails(details);
  }
}
