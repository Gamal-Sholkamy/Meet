abstract class CreatePostStates {}
class CreatePostInitialState extends CreatePostStates{}

class CreatePostGetUserDataLoadingState extends CreatePostStates{}
class CreatePostGetUserDataSuccessState extends CreatePostStates{}
class CreatePostGetUserDataErrorState extends CreatePostStates{
  final String error;
  CreatePostGetUserDataErrorState(this.error);
}

class CreatePostPostImagePickedSuccessState extends CreatePostStates{}
class CreatePostPostImagePickedErrorState extends CreatePostStates{}
class CreatePostRemovePostImageState extends CreatePostStates{}

class CreatePostLoadingState extends CreatePostStates{}
class CreatePostSuccessState extends CreatePostStates{}
class CreatePostErrorState extends CreatePostStates{
  final String error;
  CreatePostErrorState(this.error);
}

