abstract class HomeStates{}
class HomeInitialState extends HomeStates{}
class HomeChangeBottomNavSelectedIndexState extends HomeStates{}

class HomeGetUserLoadingState extends HomeStates{}
class HomeGetUserSuccessState extends HomeStates{}
class HomeGetUserErrorState extends HomeStates{
  final String error;
  HomeGetUserErrorState(this.error);
}
class HomeChangeAppModeState extends HomeStates{}