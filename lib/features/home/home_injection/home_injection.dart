import 'package:chatme/dependecy_injection/dependecy_injection.dart';
import 'package:chatme/features/home/presentation/cubits/home_cubit/home_cubit.dart';

class HomeInjection {
  void register() {
    locator.registerFactory<HomeCubit>(() => HomeCubit());
  }
}
