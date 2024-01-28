import 'package:chatme/core/contants/app_constant.dart';
import 'package:chatme/core/networks/firebase/firebase_auth_helper.dart';
import 'package:chatme/features/home/models/user_model.dart';
import 'package:chatme/features/home/presentation/cubits/home_cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initially()) {
    getAllUsers();
  }

  void getAllUsers() async {
    emit(state.copyWith(
      isLoading: true,
      isSuccess: false,
      userdata: null,
    ));
    try {
      FirebaseAPI.firestore.collection(AppConstants.usersTable).where('id', isNotEqualTo: FirebaseAPI.firebaseAuth.currentUser!.uid).snapshots().listen(
        (querySnapshot) {
          final List<UserModel> userdata = querySnapshot.docs.map((e) => UserModel.fromMap(e.data())).toList();
          emit(state.copyWith(
            isLoading: false,
            isSuccess: true,
            userdata: userdata,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        userdata: null,
      ));
    }
  }
}
