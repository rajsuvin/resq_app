import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:disaster_management_app/notificationpage.dart';
import 'package:disaster_management_app/pages.dart/mappage.dart';
import 'package:disaster_management_app/pages.dart/messagepage.dart';
import 'package:disaster_management_app/pages.dart/officerpage.dart';
import 'package:disaster_management_app/pages.dart/profilepage.dart';
import 'package:disaster_management_app/pages.dart/settingspage.dart';
import 'package:disaster_management_app/safetypage.dart';
import 'package:disaster_management_app/reporthomepage.dart';

import 'listhomepage.dart';
import 'loginpage.dart';
import 'officerlogin.dart';
import 'officerpages.dart/officernoficationpage.dart';
import 'officerpages.dart/officerprofilepage.dart';
import 'officerpages.dart/officersettingpage.dart';

class Officerhome extends StatefulWidget {
  const Officerhome({super.key});

  @override
  State<Officerhome> createState() => _OfficerhomeState();
}

class _OfficerhomeState extends State<Officerhome> {
  late SharedPreferences officerlogindata;
  late String email;

  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    officerlogindata = await SharedPreferences.getInstance();
    setState(() {
      email = officerlogindata.getString('email')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        // You can add logic here to confirm if the user wants to exit the app
        // For now, let's just exit the app
        return true; // Set this to false to prevent exiting the app.
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white60,
          appBar: AppBar(
            actions: [
              IconButton(
                padding: EdgeInsets.only(right: 50),
                icon: Icon(Icons.notifications, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Officernotifypage()));
                },
              ),
            ],
            backgroundColor: Colors.deepPurpleAccent,
            title: Text("ResQ"),
          ),
          body: Column(
            children: [
              TabBar(
                tabs: <Widget>[
                  Tab(
                    icon: Icon(
                      Icons.report,
                      color: Colors.red,
                    ),
                  ),
                  Tab(
                    icon: Icon(Icons.list, color: Colors.red),
                  ),
                  Tab(
                    icon: Icon(Icons.contacts, color: Colors.red),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // First tab - Report
                    Reportpage(), // Replace with your ReportPage widget

                    // Second tab - List
                    Listhomepage(),
                    // Container(
                    //   child: Center(
                    //     child: Text("List Page Content"),
                    //   ),
                    // ),

                    // Third tab - Notifications
                    Officerpage(),
                    // Container(
                    //   child: Center(
                    //     child: Text("Notifications Page Content"),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Text(
                    "ResQ",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Officerprofile()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.safety_check),
                  title: Text("Safety tips"),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => SafetyAndTipsPage()));
                  },
                ),

                ListTile(
                  leading: Icon(Icons.map),
                  title: Text("Map"),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Mappage()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Officersettingpage()));
                  },
                ),

                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Logout"),
                  onTap: () {
                    // Add your SettingsPage navigation here
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Settingspage()));
                    officerlogindata.setBool('login', true);
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => Officerlogin()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
