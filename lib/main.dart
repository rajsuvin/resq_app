import 'package:disaster_management_app/safetypage.dart';
import 'package:disaster_management_app/homepage.dart';
import 'package:disaster_management_app/loginpage.dart';
import 'package:disaster_management_app/officerhome.dart';
import 'package:disaster_management_app/pages.dart/settingspage.dart';
import 'package:disaster_management_app/register.dart';
import 'package:disaster_management_app/reporthomepage.dart';
import 'package:disaster_management_app/splashscreen.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'listhomepage.dart';
import 'officerlogin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Splashscreen()
    );
  }
}

