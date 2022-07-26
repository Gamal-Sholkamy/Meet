import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet/cubits/feedsCubit/states.dart';
import 'package:meet/models/postModel.dart';
import 'package:meet/models/userModel.dart';
import 'package:meet/shared/local/cacheHelper.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;

class FeedsCubit extends Cubit <FeedsStates>{
  FeedsCubit():super(FeedsInitialState());
  static FeedsCubit get(context)=>BlocProvider.of(context);
  UserModel userModel=UserModel();
  PostModel postModel=PostModel();
  void getUserFeedsData() {
    emit(FeedsGetUserDataLoadingState());
    String userID = CacheHelper.getData(key: 'userID');
    FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(FeedsGetUserDataSuccessState());
    }).catchError((e) {
      emit(FeedsGetUserDataErrorState(e.toString()));
    });
  }
  List<PostModel>posts=[];
  List<int>likes=[];
  void getPosts(){
    emit(FeedsGetPostsLoadingState());
    FirebaseFirestore.instance.collection('posts').get()
        .then((value){
      value.docs.forEach((element) {
        element.reference.
        collection('likes').get().
        then((value) {
          likes.add(value.docs.length);
          // postsID.add(element.id);
          posts.add(PostModel.fromJson(element.data()));
        }).
        catchError((onError){});

      });
      emit(FeedsGetPostsSuccessState());
    }).catchError((onError){
      emit(FeedsGetPostsErrorState(onError.toString()));
    });
  }
  void likePost(String postID){
    emit(FeedsLikePostLoadingState());
    FirebaseFirestore.instance.collection('posts').doc(postID).collection('likes').doc(userModel.userID).set(
        {
          'like':true,
        }).
    then((value) {
      emit(FeedsLikePostSuccessState());
    }).
    catchError((onError){
      emit(FeedsLikePostErrorState(onError.toString()));
    });
  }
  List<UserModel>users=[];
  void getUsers() {
    if (users.isEmpty) {
      emit(FeedsGetUsersLoadingState());
      FirebaseFirestore.instance.collection('users').get()
          .then((value) {
        value.docs.forEach((element) {
          if (element.data()['userID'] != userModel.userID) {
            users.add(UserModel.fromJson(element.data()));
          }
        });
        emit(MeetFeedsGetUsersSuccessState());
      }).catchError((onError) {
        emit(MeetFeedsGetUsersErrorState(onError.toString()));
      });
    }
  }
}