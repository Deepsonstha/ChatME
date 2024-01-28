import 'package:chatme/dependecy_injection/dependecy_injection.dart';
import 'package:chatme/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';

class ProfileInjection {
  void register() {
    locator.registerFactory<ProfileCubit>(() => ProfileCubit());
  }
}
