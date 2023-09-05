import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTextKit(animatedTexts: [
                WavyAnimatedText("Age Metrics", textStyle: TextStyle(fontSize: 40, color: Colors.grey,),speed: Duration(milliseconds: 300)),
                // WavyAnimatedText("Loading...", textStyle: TextStyle(fontSize: 20)),
              ]),
              Text("Version 1.0.0", style: TextStyle(fontSize: 12,color: Colors.grey,),)
            ],
          )
      ),
    );
  }
}