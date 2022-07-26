import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet/cubits/createPostCubit/cubit.dart';
import 'package:meet/cubits/createPostCubit/states.dart';
import 'package:meet/cubits/feedsCubit/cubit.dart';
import 'package:meet/models/postModel.dart';
import 'package:meet/models/userModel.dart';
import 'package:meet/screens/feedsScreen/feedsScreen.dart';
import 'package:meet/screens/homeScreen/homeScreen.dart';
import 'package:meet/shared/styles/icon_broken.dart';

class CreatePostScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final _postTextController=TextEditingController();
     return BlocProvider(create: (BuildContext context)=>CreatePostCubit()..getUserDataToPost(),
         child:BlocConsumer<CreatePostCubit,CreatePostStates>(
         listener: (context,state){},
         builder: (context,state){
         CreatePostCubit createPostCubit=CreatePostCubit.get(context);
         UserModel userModel=createPostCubit.userModel;
         PostModel postModel=createPostCubit.postModel;
         if(state is! CreatePostInitialState){
           return Scaffold(
             appBar: AppBar(
               actions: [
                 TextButton(
                     onPressed: (){
                       if(createPostCubit.postImage==null){
                         createPostCubit.createPost(dateTime: DateTime.now().toString(), text: _postTextController.text);
                         //FeedsCubit.get(context).getPosts();
                         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);

                       }
                       else {
                         createPostCubit.createPost(dateTime: DateTime.now().toString(), text: _postTextController.text);
                         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);

                       }
                     },
                     child: Text("post",style: Theme.of(context).textTheme.bodyText1?.
                 copyWith(
                   fontSize: 18,color: Colors.blue
                 ),)),
                 const SizedBox(width: 15,),
               ],
             ),
             body: Padding(
               padding: const EdgeInsets.all(10.0),
               child: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children:   [
                        CircleAvatar(
                         radius: 25,
                         backgroundImage: NetworkImage('${userModel.image}'),

                       ),
                       const SizedBox(width: 15,),
                       Text("${userModel.name}",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18),),

                     ],
                   ),
                   const SizedBox(height: 15,),
                   Expanded(
                       child: TextFormField(
                         controller:_postTextController,
                         keyboardType: TextInputType.text,
                         decoration: const InputDecoration(
                           border: InputBorder.none,
                           hintText: "What is in Your Mind Now ....",
                         ),
                       )
                   ),
                   if(postModel.postImage!=null)
                   Stack(
                     alignment: Alignment.topRight,
                     children: [
                       Container(
                           width: double.infinity,
                           height: 150,
                           decoration:  BoxDecoration(
                               image: DecorationImage(
                                   fit: BoxFit.cover,
                                   image: NetworkImage('${postModel.postImage}')
                               )
                           )
                       ),
                       IconButton(
                           onPressed: (){
                             createPostCubit.removePostImage();
                           },
                           icon: const CircleAvatar(child: Icon(Icons.close,size: 20,),)
                       )
                     ],
                   ),
                   const SizedBox(height: 10,),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 25),
                     child: Row(
                       children: [
                         Expanded(
                           child: OutlinedButton(

                               onPressed: (){
                                 createPostCubit.getPostImage();
                               },
                               child:Row(
                                 children: const[
                                   Icon(IconBroken.Camera),

                                   Text("Add Photo"),
                                 ],
                               )),
                         ),
                         const SizedBox(width: 20,),
                         Expanded(
                           child: OutlinedButton(
                               onPressed: (){},
                               child:Row(
                                 children: const[
                                   Icon(Icons.tag),
                                   Text("Add Tags"),
                                 ],
                               )),
                         ),

                       ],
                     ),
                   ),
                   const SizedBox(height: 10,),
                 ],
               ),
             ),

           );
         }
         else{
           return Scaffold(
             appBar: AppBar(),
             body: const Center(child: CircularProgressIndicator(),),
           );
         }
       },
       ),
     );
  }
}