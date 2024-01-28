import 'package:chatme/configs/routes.dart';
import 'package:chatme/dependecy_injection/dependecy_injection.dart';
import 'package:chatme/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:chatme/features/auth/presentation/pages/login_page.dart';
import 'package:chatme/features/bottom_nav_bar/presentation/pages/bottom_nav_screen.dart';
import 'package:chatme/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:chatme/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:chatme/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await setUpLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(create: (context) => locator()),
        BlocProvider<AuthCubit>(create: (context) => locator()),
        BlocProvider<ProfileCubit>(create: (context) => locator()),
      ],
      child: ScreenUtilInit(
        designSize: MediaQuery.of(context).size,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Chat ME',
          getPages: routes,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: FirebaseAuth.instance.currentUser == null ? const LoginPage() : const BottomNavScreen(),
        ),
      ),
    );
  }
}
