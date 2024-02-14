import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labourspot/sign_Screen.dart';
import 'package:labourspot/worker_basic_info.dart';

import 'cutomalert.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  dynamic isObscured;
  dynamic   isObscuredConfirmPassword;
  Register(String email, String password,confirmpassword)async{
    if(email==""&& password==""&& confirmpassword==""){
       showPleaseFillUpToast("error");
    }
    else{
      UserCredential? usercredential;
      try{
        usercredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
          Navigator.push(context as BuildContext, MaterialPageRoute(builder: ((context)=>SignScreen())));
        });
      }
      on FirebaseAuthException catch(ex){
        return showPleaseFillUpToast( ex.code.toString());
      }
    }
  }
  @override
  void initState() {
    super.initState();
    isObscured = true;
    isObscuredConfirmPassword = true;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                      height: 100,
                    width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6,
                            offset: Offset(0,3)
                          )
                        ]
                      ),

                      child: Image.asset("assets/labourspotregisterimage.png",scale: 3,),
                  ),

                ),
                const Text("Register",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Text("Email",style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Enter your Email",
                    prefixIcon: const Icon(Icons.email_outlined,color: Colors.grey,),
                    labelStyle:  TextStyle(color: Colors.grey.shade300),
                    enabledBorder: buildOutlineInputBorder(),
                    focusedBorder: buildOutlineInputBorder(),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text("Password",style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: isObscured,
                  obscuringCharacter: "*",
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Enter your Password",
                    prefixIcon: const Icon(Icons.key_rounded,color: Colors.grey,),
                    labelStyle:  TextStyle(color: Colors.grey.shade300),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0xff007BFF),
                      ),
                    ),
                    focusedBorder: buildOutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: isObscured
                          ? const Icon(Icons.visibility_off,color: Colors.grey,)
                          : const Icon(Icons.visibility,color: Colors.grey,),
                      onPressed: () {
                        setState(() {
                          isObscured = !isObscured;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text("Confirm Password",style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText:  isObscuredConfirmPassword,
                  obscuringCharacter: "*",
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: "Enter your confirm Password",
                    prefixIcon: const Icon(Icons.key_rounded,color: Colors.grey,),
                    labelStyle:  TextStyle(color: Colors.grey.shade300),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0xff007BFF),
                      ),
                    ),
                    focusedBorder: buildOutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon:  isObscuredConfirmPassword
                          ? const Icon(Icons.visibility_off,color: Colors.grey,)
                          : const Icon(Icons.visibility,color: Colors.grey,),
                      onPressed: () {
                        
                        setState(() {
                          isObscuredConfirmPassword = ! isObscuredConfirmPassword;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 56,
                  width: 370,
                  decoration: BoxDecoration(
                      color: const Color(0xff068BFF),
                      borderRadius: BorderRadius.circular(8)),
                  child:  Center(
                    child: InkWell(
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                     onTap:(){
                            Register(emailController.text.toString(), passwordController.text.toString(),confirmPasswordController.text.toString());
                     }
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Or login With"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.blueAccent.shade100,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset('assets/facebook.png', height: 30,),
                              const Text("Facebook", style: TextStyle(
                                fontSize: 18,
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.red.shade100,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset('assets/google.png', height: 30,),
                              const Text("Google", style: TextStyle(
                                fontSize: 18,
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already user?"),
                    InkWell(
                      child: const Text('Login',style: TextStyle(
                          color: Color(0xff068BFF)
                      ),),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const SignScreen()));
                      },
                    )
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xff007BFF),
      ),
    );
  }
  

}

