// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthState {
  final bool isLoading;
  final bool isSuccess;
  AuthState({
    required this.isLoading,
    required this.isSuccess,
  });
  factory AuthState.initially() {
    return AuthState(
      isLoading: false,
      isSuccess: false,
    );
  }

  AuthState copyWith({
    bool? isLoading,
    bool? isSuccess,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  String toString() => 'AuthState(isLoading: $isLoading, isSuccess: $isSuccess)';

  @override
  bool operator ==(covariant AuthState other) {
    if (identical(this, other)) return true;

    return other.isLoading == isLoading && other.isSuccess == isSuccess;
  }

  @override
  int get hashCode => isLoading.hashCode ^ isSuccess.hashCode;
}
