import 'dart:async';

import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  // const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
  
    Timer(
      const Duration(seconds: 5),
      // ()=>Navigator.pushNamed(context, "/login")
      // ()=>Navigator.pushNamed(context, "/verify")
      // ()=>Navigator.pushNamed(context, "/help")
      // ()=>Navigator.pushNamed(context, "/home")
      ()=>Navigator.pushNamed(context, "/details")
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:
        [
          Container(
            color:  AppColor.primary,
            child: Image.asset("assets/images/splash_background.png",
            fit: BoxFit.fill,)
            ,height: 100.h,),
          Center(child: Image.asset("assets/images/splash_logo.png",
            height: 208/height*100.h,
            width: 269/width*100.w,
          )
          ),
        ] 
      ),
    );
  }
}