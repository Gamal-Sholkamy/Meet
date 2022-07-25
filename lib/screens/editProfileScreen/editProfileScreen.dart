import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet/cubits/profileCubit/cubit.dart';
import 'package:meet/cubits/profileCubit/states.dart';
import 'package:meet/models/userModel.dart';
import 'package:meet/shared/styles/icon_broken.dart';

class EditProfileScreen extends StatelessWidget{
  var _nameController=TextEditingController();
  var _phoneController=TextEditingController();
  var _bioController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit,ProfileStates>(
      listener: (context,state){
        if (state is ProfileUpdateUserProfileErrorState){
          ProfileCubit.get(context).getUserProfileData();
        }
      },
      builder: (context,state){
        ProfileCubit editProfileCubit= ProfileCubit.get(context);
        UserModel userModel=editProfileCubit.userModel;
        _nameController.text=userModel.name! ;
        _phoneController.text=userModel.phone! ;
        _bioController.text=userModel.bio!;
        return Scaffold(
          appBar: AppBar(),
          body:
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 205,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              height: 180,
                              decoration:  BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(userModel.cover!,),
                                  ),
                                  borderRadius: const  BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      topLeft : Radius.circular(8)
                                  )  ),
                            ),
                            CircleAvatar(
                              child: IconButton(
                                onPressed: (){
                                  editProfileCubit.getCoverImage();
                                },
                                icon: const Icon(IconBroken.Camera,),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 41,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage:  NetworkImage(userModel.image!,),
                            ),
                          ),
                          CircleAvatar(
                            radius: 18,
                            child: IconButton(
                              onPressed: (){
                                editProfileCubit.getProfileImage();
                              },
                              icon: const Icon(IconBroken.Camera,size: 18,),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(IconBroken.Profile),
                            label: Text("Name"),
                            hintText: "enter your name",
                            border: OutlineInputBorder()
                        ),
                      ),
                      const SizedBox(height: 15,),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(IconBroken.User),
                            label: Text("Phone"),
                            hintText: "enter your phone number",
                            border: OutlineInputBorder()
                        ),
                      ),
                      const SizedBox(height: 15,),
                      TextFormField(
                        controller: _bioController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(IconBroken.Info_Circle),
                            label: Text("Bio"),
                            hintText: "enter your bio",
                            border: OutlineInputBorder()
                        ),
                      ),
                      const SizedBox(height: 15,),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),



                      OutlinedButton(
                          onPressed: (){
                            editProfileCubit.updateUserProfile(
                                name: _nameController.text,
                                phone: _phoneController.text,
                                bio: _bioController.text);
                          },
                          child: const Text("Update Profile")),


              ],

            ),
          ),
        );
      },
    );
  }
}