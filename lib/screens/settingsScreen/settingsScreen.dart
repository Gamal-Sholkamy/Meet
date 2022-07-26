import 'package:flutter/material.dart';
import 'package:meet/screens/loginScreen/loginScreen.dart';
import 'package:meet/shared/local/cacheHelper.dart';

class SettingsScreen extends StatelessWidget{
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            CacheHelper.removeData(key: 'userID');
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
          },
        child: const Text("Logout"),)),
    );
  }
}