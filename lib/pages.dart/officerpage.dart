import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Officer {
  final String name;
  final String position;
  final String contactNumber;

  Officer(this.name, this.position, this.contactNumber);
}

class Officerpage extends StatefulWidget {
  const Officerpage({Key? key});

  @override
  State<Officerpage> createState() => _OfficerpageState();
}

class _OfficerpageState extends State<Officerpage> {
  final List<Officer> officers = [
    Officer("John Doe", "President", "+1234567890"),
    Officer("Jane Smith", "Vice President", "+9876543210"),
    Officer("Bob Johnson", "Treasurer", "+1122334455"),
    Officer("Alice Brown", "Secretary", "+9988776655"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          "Officer List",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w200),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: officers.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  officers[index].name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  officers[index].position,
                  style: TextStyle(fontSize: 16),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.phone,
                    color: Colors.green,
                    size: 30,
                  ),
                  onPressed: () {
                    _launchCall(officers[index].contactNumber);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _launchCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
