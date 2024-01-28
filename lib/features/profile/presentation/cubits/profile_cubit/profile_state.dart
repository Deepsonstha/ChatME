// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatme/features/home/models/user_model.dart';

class ProfileState {
  final bool isLoading;
  final bool isSuccess;
  final UserModel? user;
  ProfileState({
    required this.isLoading,
    required this.isSuccess,
    this.user,
  });

  factory ProfileState.initially() {
    return ProfileState(
      isLoading: false,
      isSuccess: false,
      user: null,
    );
  }

  ProfileState copyWith({
    bool? isLoading,
    bool? isSuccess,
    UserModel? user,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      user: user ?? this.user,
    );
  }

  @override
  String toString() => 'ProfileState(isLoading: $isLoading, isSuccess: $isSuccess, user: $user)';

  @override
  bool operator ==(covariant ProfileState other) {
    if (identical(this, other)) return true;

    return other.isLoading == isLoading && other.isSuccess == isSuccess && other.user == user;
  }

  @override
  int get hashCode => isLoading.hashCode ^ isSuccess.hashCode ^ user.hashCode;
}
