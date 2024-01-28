import 'package:chatme/configs/routes.dart';
import 'package:chatme/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:chatme/features/home/presentation/cubits/home_cubit/home_state.dart';
import 'package:chatme/features/home/presentation/widgets/custom_user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state.isSuccess && state.userdata == null) {
                  return const Center(
                    child: Text("No Users Found"),
                  );
                }
                if (state.isSuccess && state.userdata == null) {
                  return const Center(
                    child: Text("No Users Found"),
                  );
                }
                if (state.isSuccess && state.userdata != null) {
                  return ListView.separated(
                    itemCount: state.userdata!.length,
                    itemBuilder: (context, index) {
                      final userdata = state.userdata?[index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed(RouteName.chatScreen, arguments: userdata);
                        },
                        child: CustomUserCard(
                          isOnline: userdata!.isOnline!,
                          image: userdata.image ?? "",
                          userName: userdata.name ?? "",
                          userAbout: userdata.about ?? "",
                          lastOnline: userdata.lastActive ?? "",
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: 5.h,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            )),
          ],
        ),
      ),
    );
  }
}
