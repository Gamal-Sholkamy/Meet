import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet/cubits/onBoardingCubit/cubit.dart';
import 'package:meet/screens/loginScreen/loginScreen.dart';
import 'package:meet/screens/onBoardingScreen/onBoardingScreen.dart';
import 'package:meet/shared/local/cacheHelper.dart';
import 'package:meet/shared/styles/icon_broken.dart';
import 'package:meet/shared/styles/themes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Widget startScreen;
  bool onBoarding=CacheHelper.getData(key: "onBoarding");
  if(onBoarding){
    startScreen= LoginScreen();
  }
  else {
    startScreen=OnBoardingScreen();
  }
  runApp( MyApp(startScreen));
}

class MyApp extends StatelessWidget {
   //MyApp({Key? key}) : super(key: key);
   Widget startScreen;
   MyApp(this.startScreen, {Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context)=>OnBoardingCubit()),
        ],
        child:MaterialApp(

          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.light,
          home: startScreen,

        ),
    );
  }
}


