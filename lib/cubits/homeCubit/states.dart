abstract class HomeStates{}
class HomeInitialState extends HomeStates{}
class ChangeBottomNavSelectedIndexState extends HomeStates{}

class HomeGetUserLoadingState extends HomeStates{}
class HomeGetUserSuccessState extends HomeStates{}
class HomeGetUserErrorState extends HomeStates{
  final String error;
  HomeGetUserErrorState(this.error);
}