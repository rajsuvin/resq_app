import 'package:flutter/material.dart';

class Listhomepage extends StatefulWidget {
  const Listhomepage({Key? key}) : super(key: key);

  @override
  State<Listhomepage> createState() => _ListhomepageState();
}

class _ListhomepageState extends State<Listhomepage> {
  // Sample data for disasters
  List<Disaster> disasters = [
    Disaster("Earthquake", "A strong earthquake occurred.", "Kannur", "9863534262"),
    Disaster("Flood", "Heavy flooding reported.", "Thiruvananthapuram", "9876543210"),
    Disaster("Wildfire", "Wildfire outbreak in the area.", "Wayanad", "7551234567"),
    // Add more disaster data as needed
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Data list"),
      ),
      body: ListView.builder(
        itemCount: disasters.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(disasters[index].type),
            subtitle: Text(disasters[index].description),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(disasters[index].location),
                Text(disasters[index].phoneNumber),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Disaster {
  final String type;
  final String description;
  final String location;
  final String phoneNumber;

  Disaster(this.type, this.description, this.location, this.phoneNumber);
}
