// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'comment_repository.dart';

part 'comment_repository_provider.g.dart';

@riverpod
CommentRepository commentRepository(CommentRepositoryRef ref) {
  return CommentRepository();
}
