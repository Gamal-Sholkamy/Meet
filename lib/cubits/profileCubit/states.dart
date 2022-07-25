abstract class ProfileStates{}
class ProfileInitialState extends ProfileStates{}
class ProfileGetUserDataLoadingState extends ProfileStates{}
class ProfileGetUserDataSuccessState extends ProfileStates{}
class ProfileGetUserDataErrorState extends ProfileStates{
  final String error;
  ProfileGetUserDataErrorState(this.error);
}

class ProfileGetProfileImageLoadingState extends ProfileStates{}
class ProfileGetProfileImageSuccessState extends ProfileStates{}
class ProfileGetProfileImageErrorState extends ProfileStates{}
class ProfileGetCoverImageLoadingState extends ProfileStates{}
class ProfileGetCoverImageSuccessState extends ProfileStates{}
class ProfileGetCoverImageErrorState extends ProfileStates{}

class ProfileUploadProfileImageLoadingState extends ProfileStates{}
class ProfileUploadProfileImageSuccessState extends ProfileStates{}
class ProfileUploadProfileImageErrorState extends ProfileStates{}
class ProfileUploadCoverImageLoadingState extends ProfileStates{}
class ProfileUploadCoverImageSuccessState extends ProfileStates{}
class ProfileUploadCoverImageErrorState extends ProfileStates{}

class ProfileUpdateUserProfileLoadingState extends ProfileStates{}
class ProfileUpdateUserProfileSuccessState extends ProfileStates{}
class ProfileUpdateUserProfileErrorState extends ProfileStates{}
