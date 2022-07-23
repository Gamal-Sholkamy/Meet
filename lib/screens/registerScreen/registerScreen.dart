import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meet/screens/homeScreen/homeScreen.dart';

import '../../shared/styles/icon_broken.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController=TextEditingController();
  final _emailController=TextEditingController();
  final _phoneController=TextEditingController();
  final _passwordController=TextEditingController();
  @override
  dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: (){
        //   Navigator.pop(context);
        // }, icon: const Icon(IconBroken.Arrow___Left_2,color: Colors.black,),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "REGISTER",style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 26,fontWeight: FontWeight.bold,)),
              const SizedBox(
                height: 15,),
              Text(
                  "Register now to join us",style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16,fontWeight: FontWeight.normal,)),
              const SizedBox(
                height: 20,),
              TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                obscureText: false,
                validator: (value){
                  if (value!.isEmpty){
                    return "Please enter your name";
                  }
                  else {
                    return null;
                  }
                },
                maxLines: 1,
                decoration:   InputDecoration(
                  hintText: "Enter your name",
                  label: Text("Name",style: Theme.of(context).textTheme.bodyText1,),
                  prefixIcon: const Icon(IconBroken.User),
                  border:  const OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )
                  ),


                ),


              ),
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
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      )
                  ),


                ),


              ),
              const SizedBox(
                height: 25,),
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
                  hintText: "Enter your Password",
                  label: Text("Password",style: Theme.of(context).textTheme.bodyText1,),
                  prefixIcon: const Icon(IconBroken.Lock),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      )
                  ),


                ),


              ),
              const SizedBox(
                height: 25,),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                obscureText: false,
                validator: (value){
                  if (value!.isEmpty){
                    return "Please enter your phone number";
                  }
                  else {
                    return null;
                  }
                },
                maxLines: 1,
                decoration:   InputDecoration(
                  hintText: "Enter your phone number",
                  label: Text("Phone", style: Theme.of(context).textTheme.bodyText1,),
                  prefixIcon: const Icon(IconBroken.Call),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )
                  ),


                ),


              ),
              const SizedBox(
                height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(

                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
                        dispose();
                      },
                      child: Text(
                        "Register",style: GoogleFonts.habibi().copyWith(fontSize: 24),),)
                ],
              ),
            ],
          ),
        ),

      ),
    );
  }
}