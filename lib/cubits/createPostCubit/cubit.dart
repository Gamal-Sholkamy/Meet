import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meet/cubits/createPostCubit/states.dart';
import 'package:meet/models/postModel.dart';
import 'package:meet/models/userModel.dart';
import 'package:meet/shared/local/cacheHelper.dart';

class CreatePostCubit extends Cubit<CreatePostStates>{
  CreatePostCubit():super(CreatePostInitialState());
  static CreatePostCubit get(context)=>BlocProvider.of(context);
  UserModel userModel=UserModel();
  PostModel postModel=PostModel();
  void getUserDataToPost() {
    emit(CreatePostGetUserDataLoadingState());
    String userID = CacheHelper.getData(key: 'userID');
    FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(CreatePostGetUserDataSuccessState());
    }).catchError((e) {
      emit(CreatePostGetUserDataErrorState(e.toString()));
    });
  }
  File? postImage;
   final picker=ImagePicker();
  Future<void> getPostImage() async{
    final pickedFile=await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile !=null){
      postImage=File(pickedFile.path);
      emit(CreatePostPostImagePickedSuccessState());
    }
    else {
      postImage=null;
      emit(CreatePostPostImagePickedErrorState());

    }
  }
  void removePostImage(){
    postImage=null;
    emit(CreatePostRemovePostImageState());
  }

  void createNewPost({
    required String name,
    required String userID,
    required String image,
    required String dateTime,
    required String text,
  })
  {
    emit(CreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance.ref().child('posts/${Uri.file(postImage!.path).pathSegments.last}').
    putFile(postImage!).
    then((value) {
      value.ref.getDownloadURL().then((value)  {
        emit(CreatePostSuccessState());

      }).catchError((e){
        emit(CreatePostErrorState(e.toString()));
      });
    }).
    catchError((onError){
      emit(CreatePostErrorState(onError.toString()));

    });

  }

  void uploadPostImage({
    required String dateTime,
    required String text,

  }){
    emit(CreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance.ref().child('posts/${Uri.file(postImage!.path).pathSegments.last}').
    putFile(postImage!).
    then((value) {
      value.ref.getDownloadURL().then((value)  {
        createPost(
            dateTime: dateTime,
            text: text,
            postImage: value);
        emit(CreatePostSuccessState());
      }).catchError((e){
        emit(CreatePostErrorState(e.toString()));
      });
    }).
    catchError((onError){
      emit(CreatePostErrorState(onError.toString()));

    });

  }
  void createPost({
    required String dateTime,
    required String text,
    String ? postImage,
  }) {
    emit(CreatePostLoadingState());
    postModel = PostModel(
      name: userModel.name,
      userID: userModel.userID,
      dateTime: dateTime,
      image: userModel.image,
      text: text,
      postImage: postImage??null,
    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(postModel!.toMap())
        .then((value) {
      getUserDataToPost();
      emit(CreatePostSuccessState());
    })
        .catchError((e) {
      emit(CreatePostErrorState(e.toString()));
    });
  }
}