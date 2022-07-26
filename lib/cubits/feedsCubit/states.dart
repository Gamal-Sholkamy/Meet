abstract class FeedsStates{}

class FeedsInitialState extends FeedsStates{}

class FeedsGetUserDataLoadingState extends FeedsStates{}
class FeedsGetUserDataSuccessState extends FeedsStates{}
class FeedsGetUserDataErrorState extends FeedsStates{
  final String error;
  FeedsGetUserDataErrorState(this.error);
}

class FeedsGetPostsLoadingState extends FeedsStates{}
class FeedsGetPostsSuccessState extends FeedsStates{}
class FeedsGetPostsErrorState extends FeedsStates{
  final String error;
  FeedsGetPostsErrorState(this.error);
}

class FeedsLikePostLoadingState extends FeedsStates{}
class FeedsLikePostSuccessState extends FeedsStates{}
class FeedsLikePostErrorState extends FeedsStates{
  final String error;
  FeedsLikePostErrorState(this.error);
}

class FeedsGetUsersLoadingState extends FeedsStates{}
class MeetFeedsGetUsersSuccessState extends FeedsStates{}
class MeetFeedsGetUsersErrorState extends FeedsStates{
  final String error;
  MeetFeedsGetUsersErrorState(this.error);
}

