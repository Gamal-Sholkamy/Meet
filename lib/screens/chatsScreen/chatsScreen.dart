import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet/cubits/chatsCubit/cubit.dart';
import 'package:meet/cubits/chatsCubit/states.dart';
import 'package:meet/models/userModel.dart';
import 'package:meet/screens/privetChatScreen/privetChatScreen.dart';

class ChatsScreen extends StatelessWidget{
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ChatsCubit,ChatsStates>(
         listener: (context,state){},
          builder: (context,state){
           ChatsCubit chatsCubit=ChatsCubit.get(context);
           UserModel userModel=chatsCubit.userModel;
           List<UserModel> users=chatsCubit.users;
           if (state is! ChatsInitialState){
             return Scaffold(
               body: ListView.separated(
                   itemBuilder: (context,index)=>buildChatItem(context,chatsCubit.users[index]),
                   separatorBuilder: (context,index)=>Container(
                     width: double.infinity,
                     height: 1,
                     color: Colors.blue,
                   ),
                   itemCount: chatsCubit.users.length) ,
             );
           }
           else{
             return Scaffold(
               body: Center(child: Text("Hello From Chats",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 22),),),
             );
           }
          },
    );

  }
  Widget buildChatItem(context,UserModel model){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivetChatScreen(model)));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
             CircleAvatar(
              backgroundImage: NetworkImage('${model.image}'),
              radius: 24,
            ),
            const SizedBox(width: 10,),
            Text("${model.name}",style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontSize: 22,
            ),),



          ],
        ),
      ),
    );
  }
}