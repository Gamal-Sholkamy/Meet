import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(IconBroken.Arrow___Left_2,color: Colors.black,),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "REGISTER",style: GoogleFonts.habibi().copyWith(fontSize: 26,fontWeight: FontWeight.bold,)),
            const SizedBox(
              height: 10,),
            Text(
                "Register now to join us",style: GoogleFonts.aBeeZee().copyWith(fontSize: 16,fontWeight: FontWeight.normal,)),
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
              decoration:  const InputDecoration(
                hintText: "Enter your name",
                label: Text("Name"),
                prefixIcon: Icon(IconBroken.User),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )
                ),


              ),


            ),
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
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    )
                ),


              ),


            ),
            const SizedBox(
              height: 20,),
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
                hintText: "Enter your Password",
                label: Text("Password"),
                prefixIcon: Icon(IconBroken.Lock),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    )
                ),


              ),


            ),
            const SizedBox(
              height: 20,),
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
              decoration:  const InputDecoration(
                hintText: "Enter your phone number",
                label: Text("Phone"),
                prefixIcon: Icon(IconBroken.Call),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )
                ),


              ),


            ),
            const SizedBox(
              height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: (){},
                    child: Text(
                      "Register",style: GoogleFonts.habibi().copyWith(fontSize: 24),),)
              ],
            ),
          ],
        ),

      ),
    );
  }
}