// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_post_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$previewEditMediaIdHash() =>
    r'aa01d61b29c1f6ee8151cbb86b2170dd562e4e91';

/// See also [previewEditMediaId].
@ProviderFor(previewEditMediaId)
final previewEditMediaIdProvider = AutoDisposeProvider<String>.internal(
  previewEditMediaId,
  name: r'previewEditMediaIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$previewEditMediaIdHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef PreviewEditMediaIdRef = AutoDisposeProviderRef<String>;
String _$editPostHash() => r'28e4d69a3b05173e7ce88ec01c81fa386576dcd8';

/// See also [EditPost].
@ProviderFor(EditPost)
final editPostProvider = NotifierProvider<EditPost, EditPostState>.internal(
  EditPost.new,
  name: r'editPostProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$editPostHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EditPost = Notifier<EditPostState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
