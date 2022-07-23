import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meet/screens/registerScreen/registerScreen.dart';
import 'package:meet/shared/styles/icon_broken.dart';

class LoginScreen extends StatefulWidget{
   LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
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
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
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
                obscureText: false,
                validator: (value){
                  if (value!.isEmpty){
                    return "Please enter your password";
                  }
                  else {
                    return null;
                  }
                },
                maxLines: 1,
                decoration:   InputDecoration(
                  label: Text("Password",style: Theme.of(context).textTheme.bodyText1,),
                  hintText: "Enter your Password",
                  prefixIcon: const Icon(IconBroken.Lock),
                  suffixIcon: const Icon(IconBroken.Show),
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

                      onPressed: (){},
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


    );
  }
}