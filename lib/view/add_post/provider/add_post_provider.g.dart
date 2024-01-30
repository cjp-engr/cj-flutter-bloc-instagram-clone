// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_post_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$previewMediaIndexHash() => r'6ceecec488c38f14d0bb76257367ecd54b8f5f5a';

/// See also [previewMediaIndex].
@ProviderFor(previewMediaIndex)
final previewMediaIndexProvider = AutoDisposeProvider<int>.internal(
  previewMediaIndex,
  name: r'previewMediaIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$previewMediaIndexHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef PreviewMediaIndexRef = AutoDisposeProviderRef<int>;
String _$addPostHash() => r'defb21ed9eec12b700f390206b7b6f33869ff74d';

/// See also [AddPost].
@ProviderFor(AddPost)
final addPostProvider = NotifierProvider<AddPost, AddPostState>.internal(
  AddPost.new,
  name: r'addPostProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$addPostHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddPost = Notifier<AddPostState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
