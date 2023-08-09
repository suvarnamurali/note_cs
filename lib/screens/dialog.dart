import 'package:flutter/material.dart';


class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({super.key,required this.controller,required this.onSave,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      content: Container(
        height: 150,
        child: Column(
          children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hoverColor: Colors.cyan,
                  border: OutlineInputBorder(
                  ),
                    hintText: "Add New Task"
                  )
                ),
            ),
              Row(
                children: [
                ElevatedButton(child:Text( "Save"), onPressed: onSave),
                SizedBox(height: 35,width: 35),
                  ElevatedButton(child:Text( "Cancel"),  onPressed: onCancel)
                ],
              )

          ],

        ),
      ),
    );
  }
}
