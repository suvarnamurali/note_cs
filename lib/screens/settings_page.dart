import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

 bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("Display options",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),),
          ),
          displayTile(
            text: "Add new items to bottom"
          ),
          displayTile(
            text: "Move ticked item to bottom"
          ),
            displayTile(
            text: "Display rich link previews"
          ),
          reminderTile(
            text: "Theme",
            time: "System default"
          ),
        Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("Reminder defaults",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),),
          ),
          reminderTile(
            text: "Morning",
            time: "8:00 am"
          ),
           reminderTile(
            text: "Afternoon",
            time: "1:00 pm"
          ),
           reminderTile(
            text: "Evening",
            time: "6:00 am"
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("Sharing",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),),
          ),
  displayTile(
            text: "Enable sharing"
          ),

        ],),
      ),
    );
  }

reminderTile({String? text,String? time}){
return Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
 
  children: [
Padding(
  padding: const EdgeInsets.only(left: 15,top: 5),
  child:   Text(text!),
),
Padding(
  padding:  const EdgeInsets.only(right: 20,top: 5),
  child:   Text(time!),
)
  ],
);
}

displayTile({String? text}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
      padding: const EdgeInsets.only(left: 15,top: 5),
        child: Text(text!),
      ),
Switch(
  
  activeColor: Colors.deepPurple.shade800,
activeTrackColor: Colors.deepPurpleAccent,
inactiveThumbColor: Colors.grey.shade800,
inactiveTrackColor: Colors.grey,
  value: isSelected, 
onChanged: (value) => setState(() => isSelected =  value))
    ],
  );
}

}