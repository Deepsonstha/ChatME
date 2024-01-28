import 'package:chatme/features/home/models/user_model.dart';
import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HomeState {
  final bool isLoading;
  final bool isSuccess;
  final List<UserModel>? userdata;
  HomeState({
    required this.isLoading,
    required this.isSuccess,
    this.userdata,
  });

  factory HomeState.initially() {
    return HomeState(
      isLoading: false,
      isSuccess: false,
      userdata: [],
    );
  }

  HomeState copyWith({
    bool? isLoading,
    bool? isSuccess,
    List<UserModel>? userdata,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      userdata: userdata ?? this.userdata,
    );
  }

  @override
  String toString() => 'HomeState(isLoading: $isLoading, isSuccess: $isSuccess, userdata: $userdata)';

  @override
  bool operator ==(covariant HomeState other) {
    if (identical(this, other)) return true;

    return other.isLoading == isLoading && other.isSuccess == isSuccess && listEquals(other.userdata, userdata);
  }

  @override
  int get hashCode => isLoading.hashCode ^ isSuccess.hashCode ^ userdata.hashCode;
}
