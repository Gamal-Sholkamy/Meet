import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet/cubits/homeCubit/cubit.dart';
import 'package:meet/cubits/loginCubit/cubit.dart';
import 'package:meet/cubits/onBoardingCubit/cubit.dart';
import 'package:meet/cubits/profileCubit/cubit.dart';
import 'package:meet/cubits/registerCubit/cubit.dart';
import 'package:meet/screens/homeScreen/homeScreen.dart';
import 'package:meet/screens/loginScreen/loginScreen.dart';
import 'package:meet/screens/onBoardingScreen/onBoardingScreen.dart';
import 'package:meet/shared/local/cacheHelper.dart';
import 'package:meet/shared/styles/themes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp();
  Widget startScreen;
  ThemeMode appMode=ThemeMode.dark;
  bool isDark=CacheHelper.getData(key: "isDark")??false;
  if(isDark){
    appMode=ThemeMode.dark;
  }
  else {
     appMode=ThemeMode.light;
  }
  bool onBoarding=CacheHelper.getData(key: "onBoarding")??false;
  String? userID=CacheHelper.getData(key: "userID");
  if(onBoarding){
    if(userID !=null){
      startScreen=HomeScreen();
    }
    else {
      startScreen= LoginScreen();
    }
  }
  else {
    startScreen=OnBoardingScreen();
  }
  runApp( MyApp( appMode: appMode, startScreen: startScreen,));
}

class MyApp extends StatelessWidget {
  final ThemeMode appMode;
   final Widget startScreen;
   const MyApp( {Key? key,required this.appMode, required this.startScreen}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context)=>OnBoardingCubit()),
          BlocProvider(create: (BuildContext context)=>RegisterCubit()),
          BlocProvider(create: (BuildContext context)=>LoginCubit()),
          BlocProvider(create: (BuildContext context)=>HomeCubit()..getUserData()),
          BlocProvider(create: (BuildContext context)=>ProfileCubit()..getUserProfileData()),


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
