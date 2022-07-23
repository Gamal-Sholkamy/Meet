import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet/cubits/loginCubit/states.dart';
import 'package:meet/shared/local/cacheHelper.dart';
import 'package:meet/shared/styles/icon_broken.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit():super(LoginLoadingState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = false;
  Icon icon = const Icon(IconBroken.Show);

  void changeSuffixIcon() {
    isPassword = !isPassword;
    isPassword
        ? icon = const Icon(IconBroken.Show)
        : icon = const Icon(Icons.visibility_off);
    emit(LoginChangeSuffixIconState());
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      CacheHelper.saveData(key: "userID", value: value.user!.uid);
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((onError) {
      emit(LoginErrorState(onError.toString()));
    });
  }
}
