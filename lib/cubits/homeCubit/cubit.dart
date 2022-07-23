import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet/cubits/homeCubit/states.dart';
import 'package:meet/models/userModel.dart';
import 'package:meet/screens/chatsScreen/chatsScreen.dart';
import 'package:meet/screens/feedsScreen/feedsScreen.dart';
import 'package:meet/screens/settingsScreen/settingsScreen.dart';
import 'package:meet/screens/usersScreen/usersScreen.dart';
import 'package:meet/shared/local/cacheHelper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  int selectedIndex = 0;
  List<String> appBarTitles = ["Feeds", "Chats", "Users", "Settings"];
  List<Widget> bodyScreens = [
    const FeedsScreen(),
    const ChatsScreen(),
    const UsersScreen(),
    const SettingsScreen()
  ];

  void changeBottomNavSelectedIndex(int index) {
    /// get users if index = 1;
    selectedIndex = index;

    emit(ChangeBottomNavSelectedIndexState());
  }

  UserModel? userModel;

  void getUserData() {
    String userID = CacheHelper.getData(key: 'userID');
    emit(HomeGetUserLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .get()
        .then((value) {
          userModel=UserModel.fromJson(value.data()!);
          emit(HomeGetUserSuccessState());
    })
        .catchError((onError) {
          emit(HomeGetUserErrorState(onError.toString()));
    });
  }
}
