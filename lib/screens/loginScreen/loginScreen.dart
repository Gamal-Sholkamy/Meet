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
                  "LOGIN",style: GoogleFonts.habibi().copyWith(fontSize: 26,fontWeight: FontWeight.bold,)),
              const SizedBox(
                height: 10,),
              Text(
                  "Login now to communicat with your community",style: GoogleFonts.aBeeZee().copyWith(fontSize: 16,fontWeight: FontWeight.normal,)),
              const SizedBox(
                height: 20,),
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
                decoration:  const InputDecoration(
                  hintText: "Enter your email address",
                  label: Text("Email Address"),
                  prefixIcon: Icon(IconBroken.Message),
                  border: OutlineInputBorder(
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
                decoration:  const InputDecoration(
                  label: Text("Password"),
                  hintText: "Enter your Password",
                  prefixIcon: Icon(IconBroken.Lock),
                  suffixIcon: Icon(IconBroken.Show),
                  //suffixIcon: Icon(Icons.visibility),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      )
                  ),


                ),


              ),
              const SizedBox(
                height: 15,),
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
                height: 15,),
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