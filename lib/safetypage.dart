import 'package:flutter/material.dart';

class SafetyAndTipsPage extends StatefulWidget {
  const SafetyAndTipsPage({Key? key}) : super(key: key);

  @override
  State<SafetyAndTipsPage> createState() => _SafetyAndTipsPageState();
}

class _SafetyAndTipsPageState extends State<SafetyAndTipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Safety Tips"),
      ),
      body: ListView(
        children: <Widget>[
          SafetyAndTipsItem(
            title: "General Emergency Preparedness",
            content:
            "Create an emergency kit with essential supplies, such as non-perishable food, water, flashlights, batteries, first aid supplies, and important documents.",
          ),
          SafetyAndTipsItem(
            title: "Severe Weather and Storms",
            content:
            "Stay informed about weather forecasts and warnings.\nSeek shelter in a sturdy building during severe storms or hurricanes.\nKeep a battery-powered weather radio for updates.",
          ),
          SafetyAndTipsItem(
            title: "Earthquakes",
            content:
            "Drop, Cover, and Hold On during shaking.\nStay indoors and away from windows.\nIf outside, move to an open area away from buildings, trees, and power lines.",
          ),
          SafetyAndTipsItem(
            title: "Floods",
            content:
            "Avoid walking or driving through floodwaters.\nMove to higher ground if you live in a flood-prone area.\nFollow evacuation orders from authorities.",
          ),
          SafetyAndTipsItem(
            title: "Wildfires",
            content:
            "Create a defensible space around your home.\nKeep flammable materials away from your house.\nEvacuate when instructed by authorities.",
          ),
          SafetyAndTipsItem(
            title: "Tornadoes",
            content:
            "Take shelter in a basement or an interior room on the lowest floor during a tornado warning.\nListen to weather alerts for updates.",
          ),
          SafetyAndTipsItem(
            title: "Hazardous Materials Incidents",
            content:
            "Stay upwind and uphill from the source of hazardous materials.\nFollow evacuation orders or shelter in place as instructed.",
          ),
          SafetyAndTipsItem(
            title: "Pandemics and Disease Outbreaks",
            content:
            "Practice good hand hygiene and respiratory etiquette.\nStay informed about the latest health guidelines and vaccination information.",
          ),
          SafetyAndTipsItem(
            title: "Power Outages",
            content:
            "Use flashlights instead of candles to prevent fires.\nKeep non-perishable food and water on hand.\nCharge mobile devices and power banks.",
          ),
          SafetyAndTipsItem(
            title: "Earthquake Preparedness",
            content:
            "Secure heavy items and furniture to prevent them from falling during an earthquake.\nKnow the 'Drop, Cover, and Hold On' technique.",
          ),
          SafetyAndTipsItem(
            title: "Heatwaves",
            content:
            "Stay hydrated and avoid outdoor activities during peak heat hours.\nUse fans, air conditioning, or find cooling centers.",
          ),
          SafetyAndTipsItem(
            title: "Winter Storms and Extreme Cold",
            content:
            "Dress in layers and cover exposed skin to prevent frostbite.\nAvoid overexertion when shoveling snow.",
          ),
          SafetyAndTipsItem(
            title: "Chemical Spills",
            content:
            "Stay away from the affected area and follow evacuation orders.\nAvoid touching or inhaling chemicals.",
          ),
          SafetyAndTipsItem(
            title: "Tsunamis",
            content:
            "Move to higher ground if you are in a coastal area during a tsunami warning.\nDo not wait for an official alert to react.",
          ),
        ],
      ),
    );
  }
}

class SafetyAndTipsItem extends StatelessWidget {
  final String title;
  final String content;

  SafetyAndTipsItem({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(content),
    );
  }
}
