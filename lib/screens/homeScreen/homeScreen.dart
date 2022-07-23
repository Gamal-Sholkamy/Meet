import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet/cubits/homeCubit/cubit.dart';
import 'package:meet/cubits/homeCubit/states.dart';
import 'package:meet/shared/styles/icon_broken.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
        listener: (context,state){},
        builder:(context,state){
          HomeCubit homeCubit =HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                homeCubit.appBarTitles[homeCubit.selectedIndex],
                style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 24,fontWeight: FontWeight.w500),),
              actions: [
                if(homeCubit.selectedIndex==1 ||homeCubit.selectedIndex==2)
                  IconButton(onPressed: (){}, icon: const Icon(IconBroken.Notification)),
                if(homeCubit.selectedIndex==1 ||homeCubit.selectedIndex==2)
                  IconButton(onPressed: (){}, icon: const Icon(IconBroken.Search)),
              ],
            ),
            body:  homeCubit.bodyScreens[homeCubit.selectedIndex],
            bottomNavigationBar: BottomNavyBar(

              backgroundColor: Colors.white12,
              selectedIndex: homeCubit.selectedIndex,
              onItemSelected: (index){
                homeCubit.changeBottomNavSelectedIndex(index);
              },
              curve: Curves.fastOutSlowIn,


              items: [
                BottomNavyBarItem(icon: const Icon(IconBroken.Home), title: const Text("Home")),
                BottomNavyBarItem(icon: const Icon(IconBroken.Chat), title: const Text("Chat")),
                BottomNavyBarItem(icon: const Icon(IconBroken.User), title: const Text("Users")),
                BottomNavyBarItem(icon: const Icon(IconBroken.Setting), title: const Text("Setting")),
              ],

            ),
          );
        } ,
    );
  }
}