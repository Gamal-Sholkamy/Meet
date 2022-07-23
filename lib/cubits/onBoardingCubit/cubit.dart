import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet/cubits/onBoardingCubit/states.dart';
import 'package:meet/models/onBoardingModel.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates>{
  OnBoardingCubit():super(OnBoardingInitialState());
  static OnBoardingCubit get(context)=>BlocProvider.of(context);
  List<OnBoardingModel>onBoarding=[
    OnBoardingModel(
        image: 'assets/images/2.jpg',title: "Meet App",body: "Come and discover our application"
    ),
    OnBoardingModel(
        image: 'assets/images/3.jpg',title: "Using Meet",body: "Communicate with your friends"
    ),
    OnBoardingModel(
        image: 'assets/images/5.jpg',title: "Support us",body: "invite your community to use our application"
    ),
  ];
  int currentIndex=0;
  void changePageLast(index){

    currentIndex=index;
    emit(OnBoardingNotLastPageState());
    if(currentIndex==onBoarding.length-1){
      emit(OnBoardingLastPageState());
    }
    print('$state');
  }
}