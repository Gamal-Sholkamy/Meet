import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget{
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(child: Text("Hello From Chats",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 22),),),
    );
  }
}