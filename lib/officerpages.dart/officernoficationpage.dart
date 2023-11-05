import 'package:flutter/material.dart';

class Officernotifypage extends StatefulWidget {
  const Officernotifypage({super.key});

  @override
  State<Officernotifypage> createState() => _OfficernotifypageState();
}

class _OfficernotifypageState extends State<Officernotifypage> {
  final List<String> notifications = [
    'Notification 1',
    'Notification 2',
    'Notification 3',
    'Notification 4',
    'Notification 5',
    'Notification 6',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3, // Add shadow
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                notifications[index],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward, // Add an arrow icon for navigation
                color: Colors.blue,
              ),
              onTap: () {
                // Handle the notification tap action
                // You can navigate to a detailed notification page or perform any action here
                print('Notification ${index + 1} tapped.');
              },
            ),
          );
        },
      ),
    );
  }
}
