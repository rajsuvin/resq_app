import 'dart:async';
import 'package:flutter/material.dart';
import 'package:neon/neon.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';

import 'loginpage.dart'; // Import your login page here

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key});

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    checkLoginState();
  }

  Future<void> checkLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    Timer(Duration(seconds: 5), () {
      if (isLoggedIn) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.white54, Colors.lightBlueAccent]),
        ),
        child: Center(
            child: Neon(
              text: 'ResQ',
              color: Colors.green,
              fontSize: 50,
              font: NeonFont.Membra,
              flickeringText: true,
              flickeringLetters: [0,1],
            )
          // child: Text('ResQ',style: TextStyle(
          //   fontSize: 35,fontWeight: FontWeight.w700,
          //     color: Colors.black87
          // ),),
        ),
      ),
    );
  }
}