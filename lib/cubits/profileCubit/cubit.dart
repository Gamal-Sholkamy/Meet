import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meet/cubits/profileCubit/states.dart';
import 'package:meet/models/postModel.dart';
import 'package:meet/models/userModel.dart';
import '../../shared/local/cacheHelper.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);
  UserModel userModel=UserModel();
  PostModel? postModel;

  void getUserProfileData() {
    emit(ProfileGetUserDataLoadingState());
    String userID = CacheHelper.getData(key: 'userID');
    FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(ProfileGetUserDataSuccessState());
    }).catchError((e) {
      emit(ProfileGetUserDataErrorState(e.toString()));
    });
  }

  File? profileImage;
  File? coverImage;
  final picker = ImagePicker();

  Future<void> getProfileImage() async {
    emit(ProfileGetProfileImageLoadingState());
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(ProfileGetProfileImageSuccessState());
    } else {
      profileImage = null;
      emit(ProfileGetCoverImageErrorState());
    }
  }

  Future<void> getCoverImage() async {
    emit(ProfileGetCoverImageLoadingState());
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(ProfileGetCoverImageSuccessState());
    } else {
      coverImage = null;
      emit(ProfileGetCoverImageErrorState());
    }
  }

  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(ProfileUploadProfileImageLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((p0) {
      p0.ref.getDownloadURL().then((value) {
        updateUserProfile(name: name, phone: phone, bio: bio);
        getUserProfileData();
        emit(ProfileUploadProfileImageSuccessState());
      }).catchError((onError) {
        emit(ProfileUploadProfileImageErrorState());
      });
    }).catchError((onError) {
      emit(ProfileUploadProfileImageErrorState());
    });
  }

  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(ProfileUploadCoverImageLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((p0) {
      p0.ref.getDownloadURL().then((value) {
        updateUserProfile(name: name, phone: phone, bio: bio);
        getUserProfileData();
        emit(ProfileUploadCoverImageSuccessState());
      }).catchError((onError) {
        emit(ProfileUploadCoverImageErrorState());
      });
    }).catchError((error) {
      emit(ProfileUploadCoverImageErrorState());
    });
  }

  void updateUserProfile({
    required String name,
    required String phone,
    required String bio,
    String? image,
    String? cover,
  }) {
    emit(ProfileUpdateUserProfileLoadingState());
    if (profileImage != null) {
      uploadProfileImage(name: name, phone: phone, bio: bio);
    } else if (coverImage != null) {
      uploadCoverImage(name: name, phone: phone, bio: bio);
    } else {
      userModel = UserModel(
        name: name,
        email: userModel.email!,
        phone: phone,
        userID: userModel.userID,
        bio: bio,
        image: image ?? userModel.image!,
        cover: cover ?? userModel.cover!,
      );
      FirebaseFirestore.instance.
      collection('users').
      doc(userModel.userID!).set(userModel.toMap()).
      then((value) {
        getUserProfileData();
        emit(ProfileUpdateUserProfileSuccessState());
      }).catchError((onError){
        emit(ProfileUpdateUserProfileErrorState());
      });
    }
  }
}
