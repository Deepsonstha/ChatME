import 'dart:developer';

import 'package:chatme/features/auth/auth_injection/auth_injection.dart';
import 'package:chatme/features/home/home_injection/home_injection.dart';
import 'package:chatme/features/profile/profile_injection/profile_injection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

Future<void> setUpLocator() async {
  log('locator regiters', name: "location register");
  HomeInjection().register();
  AuthInjection().register();
  ProfileInjection().register();

  locator.registerLazySingleton(() => FirebaseAuth.instance);
  locator.registerLazySingleton(() => FirebaseFirestore.instance);
}
