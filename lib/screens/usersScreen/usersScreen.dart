import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget{
  const UsersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(child: Text("Hello From Users",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 22),),),
    );
  }
}