import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Center(
        child: Text("Home",style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 30),)
        ),
    );
  }
}