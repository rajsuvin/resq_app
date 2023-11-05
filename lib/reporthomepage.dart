import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

import 'listhomepage.dart';

class Reportpage extends StatefulWidget {
  const Reportpage({Key? key}) : super(key: key);

  @override
  State<Reportpage> createState() => _ReportpageState();
}

class _ReportpageState extends State<Reportpage> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String? selectedDisasterType;



  void _submitReport() async {
    String description = descriptionController.text;
    String location = locationController.text;
    String phoneNumber = phoneNumberController.text;

    if (description.isNotEmpty && location.isNotEmpty && phoneNumber.isNotEmpty) {
      // Only proceed if all fields have data.

      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> reports = prefs.getStringList('reports') ?? [];

      // Create a map to represent the report
      Map<String, String> reportData = {
        'description': description,
        'location': location,
        'phoneNumber': phoneNumber,
        'disasterType': selectedDisasterType ?? '',
      };

      // Add the report data to the list of reports
      reports.add(reportData.toString());

      // Store the updated list of reports in shared preferences
      await prefs.setStringList('reports', reports);

      // Clear the text fields and reset disaster type
      descriptionController.clear();
      locationController.clear();
      phoneNumberController.clear();
      selectedDisasterType = null;

      // Show a confirmation message to the user
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Report Submitted'),
            content: Text('Thank you for your report.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Handle the case where not all fields are filled, e.g., show an error message.
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all fields.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
  // Future<void> insertrecord() async{
  //   if(phoneNumberController.text==""|| selectedDisasterType.text==""||
  //       descriptionController.text==""||locationController.text=="" ){
  //     try{
  //       String uri ="http://http://localhost/resq_php_api/insert_data.php";
  //       var res=await http.post(Uri.parse(uri),body:(
  //           "phoneNumberController":phoneNumberController.text,
  //           "selectedDisasterType": selectedDisasterType?.text,
  //           "descriptionController":  descriptionController.text,
  //           "locationController": locationController.text,
  //       ));
  //       var response=jsonDecode(res.body);
  //       if(response["Success"]=="true"){
  //         print("Record inserted");
  //       }
  //       else{
  //         print("Some error occured");
  //       }
  //     }
  //     catch(e){
  //       print(e);
  //     }
  //   }
  //   else{
  //     print("Please fill all fields");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Disaster'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Type of Disaster:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              value: selectedDisasterType,
              items: <String>['Earthquake', 'Flood', 'Hurricane', 'Fire', 'Tsunami', 'Other']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedDisasterType = newValue;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Description:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Provide details about the disaster...',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Location:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: locationController,
              decoration: InputDecoration(
                hintText: 'Enter the location of the disaster...',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Phone Number:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                hintText: 'Enter your phone number...',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16.0),
            // ElevatedButton(
            //   // onPressed:(){
            //   // insertrecord(), }
            //   _submitReport,
            //   child: Text('Submit Report'),
            // ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Listhomepage()));
            }, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}