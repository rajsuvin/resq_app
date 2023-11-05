import 'dart:ui';

import 'package:disaster_management_app/officerhome.dart';
import 'package:disaster_management_app/officerregister.dart';
import 'package:disaster_management_app/pages.dart/officerpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:disaster_management_app/register.dart';

import 'homepage.dart';

class Officerlogin extends StatefulWidget {
  const Officerlogin({super.key});

  @override
  State<Officerlogin> createState() => _OfficerloginState();
}

class _OfficerloginState extends State<Officerlogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late SharedPreferences officerlogindata;
  late bool newofficer;
  
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }
  void check_if_already_login() async {
    officerlogindata = await SharedPreferences.getInstance();
    newofficer = (officerlogindata.getBool('login') ?? true);
    print(newofficer);
    if (newofficer == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => Officerhome()));
    }
  }

  void _navigateToOfficerhome() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      // If login is successful, user data stored in using shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);

      // Navigate to the main application screen
      Navigator.push(context, MaterialPageRoute(builder: (context) => Officerhome()));
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
        onWillPop: ()=>_onBackButtonPressed(context),
        child: Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image
          Image.asset(
            'assets/images/dm.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2), // Adjust the sigma values for blur intensity
            child: Container(
              color: Colors.black.withOpacity(0.5), // Adjust the opacity for the blur effect
            ),
          ),
          SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: screenWidth * 0.33, top: 30),
            child: const Text(
              "Officer Login",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Email Text Field
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        labelText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    // Password Text Field
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        labelText: 'Password',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password.';
                        } else if (value.length < 10) {
                          return 'Password must contain at least 10 characters.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                    // Login Button
                    ElevatedButton(onPressed: (){
                      String email = _emailController.text;
                      String password = _passwordController.text;
                      if(email!=''&& password != ''){
                        print("Success");
                        officerlogindata.setBool('login', false);
                        officerlogindata.setString('email', email);
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                        _navigateToOfficerhome();
                      }
                    }, child: Text("Login")),
                    SizedBox(height: 20),

                    // SizedBox(height: 150),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool? exitApp = await showDialog(context: context, builder: (BuildContext){
      return AlertDialog(
        title: Text("Really ?"),
        content: Text("Do you want to close the ResQ ?"),
        actions: <Widget>[
          TextButton(onPressed: (){
            Navigator.of(context).pop(false);
          }, child: Text("No"),
          ),
          TextButton(onPressed: (){
            Navigator.of(context).pop(true);
          }, child: Text("Yes"),
          ),
        ],
      );
    }
    );
    return exitApp?? false;
  }
  }

