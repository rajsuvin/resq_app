// import 'package:disaster_management_app/officerhome.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'homepage.dart';
// import 'loginpage.dart';
// import 'officerlogin.dart';
// class Officereg extends StatefulWidget {
//   const Officereg({super.key});
//
//   @override
//   State<Officereg> createState() => _OfficeregState();
// }
//
// class _OfficeregState extends State<Officereg> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController phoneNumberController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//
//   void _navigateToOfficerlogin() {
//     Navigator.push(context, MaterialPageRoute(builder: (context) => Officerlogin()));
//   }
//
//   void _navigateToOfficerhome() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('name', nameController.text);
//     prefs.setString('phoneNumber', phoneNumberController.text);
//     prefs.setString('email', emailController.text);
//
//
//     Navigator.push(context, MaterialPageRoute(builder: (context) => Officerhome()));
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           // Background Image
//           Image.asset(
//             'assets/images/loginpic.jfif',
//             width: double.infinity,
//             height: double.infinity,
//             fit: BoxFit.cover,
//           ),
//           Container(
//             padding: EdgeInsets.only(left: screenWidth * 0.48, top: 30),
//             child: const Text(
//               "Register",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 25,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ListView(
//               children: [
//                 SizedBox(height: 90), // Gap at the top
//                 TextFormField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(16),
//                       borderSide: BorderSide.none,
//                     ),
//                     labelText: 'Name',
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 20), // Spacing between fields
//                 TextFormField(
//                   controller: phoneNumberController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(16),
//                       borderSide: BorderSide.none,
//                     ),
//                     labelText: 'Phone Number',
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(16),
//                       borderSide: BorderSide.none,
//                     ),
//                     labelText: 'Email',
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: passwordController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(16),
//                       borderSide: BorderSide.none,
//                     ),
//                     labelText: 'Password',
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                   obscureText: true,
//                 ),
//
//
//                 SizedBox(height: 40),
//                 ElevatedButton(
//                   onPressed: _navigateToOfficerhome,
//                   child: Text('Register', style: TextStyle(fontSize: 18)),
//                 ),
//                 SizedBox(height: 10),
//                 TextButton(
//                   onPressed: _navigateToOfficerlogin,
//                   child: Text("Already have an account? Login here"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
