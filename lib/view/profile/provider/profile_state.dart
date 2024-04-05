// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProfileState {
  final int? scrollToIndex;

  ProfileState({
    this.scrollToIndex,
  });

  ProfileState copyWith({
    int? scrollToIndex,
  }) {
    return ProfileState(
      scrollToIndex: scrollToIndex ?? this.scrollToIndex,
    );
  }
}
