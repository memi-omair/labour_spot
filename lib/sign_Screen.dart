import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labourspot/cutomalert.dart';
import 'package:labourspot/home_screen.dart';
import 'package:labourspot/register_screen.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  dynamic isObscured;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  login(String email,String password) async{
    if(email=="" && password==""){
             showPleaseFillUpToast("error");

    }
    else{
      UserCredential? usercredential;
      try{
        usercredential= await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
          Navigator.push(context, MaterialPageRoute(builder: ((context) => HomeScreen(title:"login"))));
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
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Image.asset("assets/labourspotsigninimage.png",scale: 2,),
                ),

                const SizedBox(
                  height: 20,
                ),
                const Text("Sign in",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
                ),
                const SizedBox(
                  height: 20,
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
                  controller: passwordController,

                  obscuringCharacter: "*",
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
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  child: Container(
                      margin: const EdgeInsets.only(top: 30),
                      height: 56,
                      width: 370,
                      decoration: BoxDecoration(
                          color: const Color(0xff068BFF),
                          borderRadius: BorderRadius.circular(8)),
                       child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                       ),
                  ),
                  // on tap of login page 
                  onTap: (){
                    login(emailController.text.toString(), passwordController.text.toString());

                  },
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
                    const Text("New to the app?"),
                    InkWell(
                      child: const Text('Register',style: TextStyle(
                        color: Color(0xff068BFF)
                      ),),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const RegisterScreen()));
                      },
                    )
                  ],
                ),
            ],
            ),
          ),
        ),
      )
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
