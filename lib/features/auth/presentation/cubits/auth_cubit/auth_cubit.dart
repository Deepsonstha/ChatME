// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:chatme/configs/routes.dart';
import 'package:chatme/core/contants/app_constant.dart';
import 'package:chatme/core/networks/firebase/firebase_auth_helper.dart';
import 'package:chatme/core/utils/app_utils.dart';
import 'package:chatme/features/auth/presentation/cubits/auth_cubit/auth_state.dart';
import 'package:chatme/features/home/models/user_model.dart';
import 'package:chatme/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initially());

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      final GoogleSignInAuthentication? googleSignInAuthentication = await googleUser?.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );

      AppUtils.showProgressDialog(context);

      await FirebaseAPI.firebaseAuth.signInWithCredential(credential).then((user) async {
        if ((await FirebaseAPI.firestore.collection(AppConstants.usersTable).doc(FirebaseAPI.firebaseAuth.currentUser?.uid).get()).exists) {
          BlocProvider.of<HomeCubit>(context).getAllUsers();
          Get.back();
          Get.offNamedUntil(RouteName.bottomNavScreen, (route) => false);
        } else {
          await FirebaseAPI.firestore
              .collection(AppConstants.usersTable)
              .doc(user.user?.uid)
              .set(UserModel(
                      id: user.user!.uid,
                      name: user.user?.displayName,
                      email: user.user?.email,
                      image: user.user?.photoURL,
                      createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
                      isOnline: false,
                      lastActive: DateTime.now().millisecondsSinceEpoch.toString(),
                      pushToken: '',
                      about: "Hello I am new user")
                  .toMap())
              .then((value) {
            Get.offNamedUntil(RouteName.bottomNavScreen, (route) => false);
          });
        }
      });
    } catch (e) {
      AppUtils.showErrorSnackBar(msg: e.toString(), context: context);
    }
  }

  Future<void> signOutWithSocials() async {
    try {
      await _googleSignIn.signOut();
      await FirebaseAPI.firebaseAuth.signOut();
      Get.offNamedUntil(RouteName.login, (route) => false);
    } catch (error) {
      log("Error signing out with Google: $error");
    }
  }
}
