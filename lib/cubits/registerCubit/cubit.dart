import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet/cubits/registerCubit/states.dart';
import 'package:meet/models/userModel.dart';
import 'package:meet/shared/styles/icon_broken.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  bool isPassword = false;
  Icon icon = const Icon(IconBroken.Show);

  void changeSuffixIcon() {
    isPassword = !isPassword;
    isPassword
        ? icon = const Icon(IconBroken.Show)
        : icon = const Icon(Icons.visibility_off);
    emit(RegisterChangeSuffixIconState());
  }

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
      password: password,
    ).then((value) {
        createUser(userID: value.user!.uid, name: name, email: email, phone: phone);
        emit(RegisterSuccessState());
    }).catchError((onError){
      emit(RegisterErrorState(onError.toString()));
    });
  }
  void createUser({
    required String userID,
    required String name,
    required String email,
    required String phone,

}){
    emit(RegisterCreateUserLoadingState());
    UserModel userModel =UserModel(
      userID: userID,
      name: name,
      email: email,
      phone: phone,
      image: "https://img.freepik.com/free-vector/man-shows-gesture-great-idea_10045-637.jpg?w=740&t=st=1658063469~exp=1658064069~hmac=d90089a60d2f137f4d07443ce14bd72f9c2761287847a60a343c84ce4f3263e4",
      cover: "https://img.freepik.com/free-photo/happy-young-woman-sitting-floor-using-laptop-gray-wall_231208-11480.jpg?size=626&ext=jpg&uid=R30639821&ga=GA1.2.91118807.1657976754",
      bio: "write a short description about yourself ",
    );
    FirebaseFirestore.instance.collection('users').
    doc(userID).set(userModel.toMap()).
    then((value) {
      emit(RegisterCreateUserSuccessState(userID));
    }).catchError((onError){
      emit(RegisterCreateUserErrorState(onError.toString()));
    });
  }
}
