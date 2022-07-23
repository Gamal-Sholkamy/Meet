import 'package:flutter/material.dart';
import 'package:meet/shared/styles/icon_broken.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:  const Center(child: Icon(IconBroken.Arrow___Down_Circle,size: 50,),),
    );
  }
}