import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet/cubits/homeCubit/cubit.dart';
import 'package:meet/cubits/homeCubit/states.dart';
import 'package:meet/shared/local/cacheHelper.dart';
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
                if(homeCubit.selectedIndex==0 ||homeCubit.selectedIndex==1 ||homeCubit.selectedIndex==2)
                  IconButton(onPressed: (){}, icon: const Icon(IconBroken.Notification)),
                if(homeCubit.selectedIndex==0 ||homeCubit.selectedIndex==1 ||homeCubit.selectedIndex==2)
                  IconButton(
                      onPressed: (){},
                      icon: const Icon(IconBroken.Search)),
                if(homeCubit.selectedIndex==4)
                  IconButton(onPressed: (){
                    homeCubit.changeAppMode();
                  }, icon: const Icon(IconBroken.Edit_Square)),
                const SizedBox(width: 10,)


              ],
            ),
            body:  homeCubit.bodyScreens[homeCubit.selectedIndex],
            bottomNavigationBar: ConvexAppBar(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor!,
              color: Colors.brown,
              activeColor: Theme.of(context).primaryColor,
              height: 50,
              top: -25,
              curveSize: 80,
              elevation: 1.0,
              style: TabStyle.flip,
              initialActiveIndex: homeCubit.selectedIndex,
              onTap: (index){
                homeCubit.changeBottomNavSelectedIndex(index);
              },
              items: const[
                TabItem(icon:  Icon(IconBroken.Chat,color: Colors.blue,), title:  "Chat"),                TabItem(icon:  Icon(IconBroken.User,color: Colors.blue,), title:  "Users"),
                TabItem(icon:  Icon(IconBroken.Home,color: Colors.blue,), title:  "Home"),
                TabItem(icon:  Icon(IconBroken.Profile,color: Colors.blue,), title:  "Profile"),
                TabItem(icon:  Icon(IconBroken.Setting,color: Colors.blue,), title:  "Setting"),
              ],),

            // bottomNavigationBar: BottomNavyBar(
            //   showElevation: false,
            //   backgroundColor: Colors.white12,
            //   selectedIndex: homeCubit.selectedIndex,
            //   onItemSelected: (index){
            //     homeCubit.changeBottomNavSelectedIndex(index);
            //   },
            //   curve: Curves.fastOutSlowIn,
            //
            //
            //   items: [
            //     BottomNavyBarItem(icon: const Icon(IconBroken.Home), title: const Text("Home")),
            //     BottomNavyBarItem(icon: const Icon(IconBroken.Chat), title: const Text("Chat")),
            //     BottomNavyBarItem(icon: const Icon(IconBroken.User), title: const Text("Users")),
            //     BottomNavyBarItem(icon: const Icon(IconBroken.Setting), title: const Text("Setting")),
            //   ],
            //
            // ),
          );
        } ,
    );
  }
}