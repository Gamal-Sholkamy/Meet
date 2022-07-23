import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme=ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.blue,
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
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
  //iconTheme: const IconThemeData(color: Colors.black,),
  fontFamily: "jannah",
  textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.black)
  ),

);

ThemeData darkTheme=ThemeData(

  scaffoldBackgroundColor: Colors.black,
  primaryColor: Colors.blue,
  primarySwatch: Colors.blue,
  appBarTheme:  const AppBarTheme(
    color: Colors.black,
    titleSpacing: 15.0,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle:  TextStyle(color: Colors.white),
    actionsIconTheme:  IconThemeData(color: Colors.white,),


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
  iconTheme: const IconThemeData(color: Colors.white,),
  fontFamily: "jannah",
  textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.white)
  ),

);