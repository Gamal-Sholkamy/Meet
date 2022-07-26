import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme textTheme=GoogleFonts.aBeeZeeTextTheme();
TextTheme lightTextTheme=textTheme.copyWith(
  bodyText1: textTheme.bodyText1!.copyWith(
    color: Colors.black,fontSize: 18
  ),
    bodyText2: textTheme.bodyText2!.copyWith(
    color: Colors.black)
);
TextTheme darkTextTheme=textTheme.copyWith(
    bodyText1: textTheme.bodyText1!.copyWith(
        color: Colors.white
    ),
    bodyText2: textTheme.bodyText2!.copyWith(
        color: Colors.white)
);


ThemeData lightTheme=ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.blue,
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    color: Colors.white,
    titleSpacing: 15.0,
    elevation: 0.0,
    systemOverlayStyle:  SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark
    ),
    titleTextStyle:  TextStyle(color: Colors.black),
    actionsIconTheme:  IconThemeData(color: Colors.black,),


  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 0.0,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,

  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.blue,
    elevation: 0.0,

  ),
  outlinedButtonTheme:   OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        primary: Colors.black,
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 4,
        )
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.black,),
  //fontFamily: "jannah",
  textTheme: lightTextTheme,


);

ThemeData darkTheme=ThemeData(

  scaffoldBackgroundColor: Colors.black,
  primaryColor: Colors.blue,
  primarySwatch: Colors.blue,
  appBarTheme:  const AppBarTheme(
    actionsIconTheme:  IconThemeData(color: Colors.white,),
    color: Colors.black,
    titleSpacing: 15.0,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle:  TextStyle(color: Colors.white),



  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    elevation: 0.0,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,

  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.blue,
    elevation: 0.0,

  ),
  iconTheme: const IconThemeData(
    color: Colors.white,),
  inputDecorationTheme: const InputDecorationTheme(
    focusColor: Colors.white,
    hintStyle:  TextStyle(color: Colors.white),
    border: OutlineInputBorder(
      borderSide:  BorderSide(color: Colors.white,),
    ),
    focusedBorder:  OutlineInputBorder(      borderSide: BorderSide(color: Colors.white,),


    ),
    enabledBorder:  OutlineInputBorder(      borderSide: BorderSide(color: Colors.white,),


),
    iconColor: Colors.white,


  ),
  outlinedButtonTheme:   OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: Colors.white,
          backgroundColor: Colors.blue,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      )
    ),
  ),

  textTheme: darkTextTheme,

);