// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:chatme/core/contants/app_constant.dart';
import 'package:chatme/core/networks/firebase/firebase_auth_helper.dart';
import 'package:chatme/features/home/models/user_model.dart';
import 'package:chatme/features/profile/presentation/cubits/profile_cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initially()) {
    getProfile();
  }

  void getProfile() async {
    emit(state.copyWith(
      isLoading: true,
      isSuccess: false,
      user: null,
    ));

    var userget = await FirebaseAPI.firestore.collection(AppConstants.usersTable).doc(FirebaseAPI.firebaseAuth.currentUser?.uid).get();
    if ((userget.exists)) {
      UserModel user = UserModel.fromMap(userget.data()!);
      log("user:$user");
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        user: user,
      ));
    } else {}
  }
}
