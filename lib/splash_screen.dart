import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labourspot/home_screen.dart';
import 'package:labourspot/sign_Screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen= SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/labourspotsplashScreen.png"),
              fit: BoxFit.fill,
            ),

          ),

        ),

      ),
    );
  }
}
class SplashServices{
  void isLogin(BuildContext context){
    final auth = FirebaseAuth.instance;
    final User = auth.currentUser;
    if(User != null){
      Timer(const Duration(seconds: 3),()=>Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
            const HomeScreen(title: '',))));

    }
    else{
      Timer(const Duration(seconds: 3),()=>Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
            const SignScreen())));
    }
    
  }
}
