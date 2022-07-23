import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meet/cubits/loginCubit/cubit.dart';
import 'package:meet/cubits/loginCubit/states.dart';
import 'package:meet/screens/homeScreen/homeScreen.dart';
import 'package:meet/screens/registerScreen/registerScreen.dart';
import 'package:meet/shared/local/cacheHelper.dart';
import 'package:meet/shared/styles/icon_broken.dart';

class LoginScreen extends StatefulWidget{
   LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final formKey=GlobalKey<FormState>();
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
   @override
   dispose() {
     _emailController.dispose();
     _passwordController.dispose();
     super.dispose();
   }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){
        if(state is LoginSuccessState){
          CacheHelper.saveData(key: "userID", value: state.userID);
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
          //dispose();
        }
      },
      builder: (context,state){
        LoginCubit loginCubit=LoginCubit.get(context);
        return  Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "LOGIN",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 26,fontWeight: FontWeight.bold,)),
                    const SizedBox(
                      height: 10,),
                    Text(
                        "Login now to communicat with your community",style: GoogleFonts.aBeeZee().copyWith(fontSize: 16,fontWeight: FontWeight.normal,)),
                    const SizedBox(
                      height: 25,),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      validator: (value){
                        if (value!.isEmpty){
                          return "Please enter your email address";
                        }
                        else {
                          return null;
                        }
                      },
                      maxLines: 1,
                      decoration:   InputDecoration(
                        hintText: "Enter your email address",
                        label: Text("Email Address",style: Theme.of(context).textTheme.bodyText1,),
                        prefixIcon: const Icon(IconBroken.Message),
                        border:const  OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            )
                        ),


                      ),


                    ),
                    const SizedBox(
                      height: 15,),
                    TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: loginCubit.isPassword,
                      validator: (value){
                        if (value!.isEmpty){
                          return "Please enter your password";
                        }
                        else {
                          return null;
                        }
                      },
                      maxLines: 1,
                      onFieldSubmitted: (value){
                        if(formKey.currentState!.validate()){
                          loginCubit.userLogin(
                              email: _emailController.text ,
                              password: _passwordController.text);
                        }
                      },
                      decoration:   InputDecoration(
                        label: Text("Password",style: Theme.of(context).textTheme.bodyText1,),
                        hintText: "Enter your Password",
                        prefixIcon: const Icon(IconBroken.Lock),
                        suffixIcon: IconButton(
                          onPressed: (){
                            loginCubit.changeSuffixIcon();
                          },
                          icon: loginCubit.icon,
                        ),
                        //suffixIcon: Icon(Icons.visibility),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            )
                        ),


                      ),


                    ),
                    const SizedBox(
                      height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        OutlinedButton(

                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              loginCubit.userLogin(
                                  email: _emailController.text ,
                                  password: _passwordController.text);
                            }
                          },
                          child:Text(
                            "Login",style: GoogleFonts.habibi().copyWith(fontSize: 24),),
                        ),

                      ],
                    ),
                    const SizedBox(
                      height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account ?",
                          style: GoogleFonts.aBeeZee().copyWith(fontSize: 16),),
                        const SizedBox(
                          width: 5,
                        ),
                        TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                              dispose();
                            },
                            child: Text("REGISTER NOW",style: GoogleFonts.aBeeZee().copyWith(fontSize: 16),))
                      ],
                    ),



                  ],
                ),
              ),
            ),
          ),


        );
      },

    );
  }
}