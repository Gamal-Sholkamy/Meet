import 'package:flutter/material.dart';

class FeedsScreen extends StatelessWidget{
  const FeedsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(child: Text("Hello From Feeds",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 22),),),
    );
  }
}