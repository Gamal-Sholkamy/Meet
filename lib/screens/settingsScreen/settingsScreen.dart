import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget{
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(child: Text("Hello From Settings",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 22),),),
    );
  }
}