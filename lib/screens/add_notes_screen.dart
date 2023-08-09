import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function (BuildContext)? deleteFunction;
  Function (BuildContext)? editFunction;

   ToDoList({super.key,
       required this.taskName,
       required this.taskCompleted,
       required this.onChanged,
        required this.deleteFunction,
        required this.editFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15,right:15,bottom: 10,top:10),
        child:Slidable(
          endActionPane: ActionPane(
            motion: ScrollMotion(), 
            children: [
              SlidableAction(onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Color.fromRGBO(6, 65, 113, 1),),
              SlidableAction(onPressed: editFunction,
              icon: Icons.edit,
              backgroundColor: Color.fromRGBO(3, 150, 243, 1),)
            ],
          ),
        child:Container(
          padding: EdgeInsets.all(25),
          child: Row(
            children: [
              //checkbox

              Checkbox(value: taskCompleted, onChanged: onChanged),
              Text(taskName,
              style: taskCompleted? TextStyle(decoration: TextDecoration.lineThrough):TextStyle(decoration: TextDecoration.none),),

            ],
          )
          ,decoration: BoxDecoration(color:Colors.blue[100],borderRadius: BorderRadius.circular(12)
        ),
        )
    ),);
  }
}
