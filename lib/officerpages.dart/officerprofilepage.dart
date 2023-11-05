import 'package:flutter/material.dart';
class Officerprofile extends StatefulWidget {
  const Officerprofile({super.key});

  @override
  State<Officerprofile> createState() => _OfficerprofileState();
}

class _OfficerprofileState extends State<Officerprofile> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  // Define initial values (can be loaded from user data)
  String initialUsername = 'Suvin';
  String initialEmail = 'raj@suvin.com';
  String initialLocation = 'New York';

  bool isEditing = false; // Tracks whether the user is in edit mode

  @override
  void initState() {
    super.initState();
    usernameController.text = initialUsername;
    emailController.text = initialEmail;
    locationController.text = initialLocation;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Officer Profile'),
        actions: <Widget>[
          isEditing
              ? IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveChanges,
          )
              : IconButton(
            icon: Icon(Icons.edit),
            onPressed: _startEditing,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile_image.jpg'),
            ),
            SizedBox(height: 20),
            isEditing
                ? TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            )
                : Text(
              usernameController.text,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20,),
            isEditing
                ? TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            )
                : Text(emailController.text),
            SizedBox(height: 20,),
            isEditing
                ? TextFormField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(),
              ),
            )
                : Text(locationController.text),
            SizedBox(height: 20,),
            isEditing
                ? TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            )
                : Text('********'), // Display asterisks for password
          ],
        ),
      ),
    );
  }

  void _startEditing() {
    setState(() {
      isEditing = true;
    });
  }

  void _saveChanges() {
    // You can save the changes to your data storage here
    setState(() {
      isEditing = false;
      initialUsername = usernameController.text;
      initialEmail = emailController.text;
      initialLocation = locationController.text;
    });
  }
}
