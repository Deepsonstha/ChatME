import 'package:chatme/dependecy_injection/dependecy_injection.dart';
import 'package:chatme/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';

class AuthInjection {
  void register() {
    locator.registerFactory<AuthCubit>(() => AuthCubit());
  }
}
