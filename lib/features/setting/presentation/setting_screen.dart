import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatme/core/custom_widgets/custom_elevated_buttom.dart';
import 'package:chatme/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:chatme/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:chatme/features/profile/presentation/cubits/profile_cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.r),
                        child: Container(
                          height: 80.h,
                          width: 80.h,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                          ),
                          child: CachedNetworkImage(imageUrl: state.user!.image!),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        children: [
                          Text(
                            state.user?.name ?? "",
                            style: TextStyle(fontSize: 20.sp),
                          ),
                          Text(state.user?.email ?? ""),
                        ],
                      ),
                      SizedBox(width: 80.w),
                      SizedBox(
                        width: 50.w,
                        height: 50.h,
                        child: const Icon(Icons.edit_note_sharp),
                      )
                    ],
                  );
                },
              ),
              SizedBox(
                height: 100.h,
              ),
              CustomElevatedButton(
                title: "get user",
                onPressed: () {
                  BlocProvider.of<ProfileCubit>(context).getProfile();
                },
              ),
              CustomElevatedButton(
                title: "Logout",
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context).signOutWithSocials();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
