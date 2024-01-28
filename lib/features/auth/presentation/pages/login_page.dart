import 'package:chatme/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  _handleGoogleLogin(BuildContext context) {
    BlocProvider.of<AuthCubit>(context).signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              Icons.chat,
              size: 100,
            ),
          ),
          Text(
            "Chat ME",
            style: TextStyle(
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 100.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: GestureDetector(
              onTap: () {
                _handleGoogleLogin(context);
              },
              child: Container(
                height: 50.h,
                width: 1.sw,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                    child: Text(
                  "Login with Google",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
