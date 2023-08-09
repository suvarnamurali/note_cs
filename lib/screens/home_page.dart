import 'package:flutter/material.dart';
import 'package:todo_notes_app/screens/add_notes_screen.dart';
import 'package:todo_notes_app/screens/dialog.dart';
import 'package:todo_notes_app/screens/settings_page.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller= TextEditingController();
  List toDoList = [["Go Shopping",false],["Learn Coding",false]];

  void SaveNewTask(){
    setState(() {
      toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }
  void edittheTask(int index){
  setState(() {
   toDoList[index][0]= _controller.text; 
   _controller.clear();

  });
     
   
   Navigator.of(context).pop();
  }

  void editTask(int index){
   showDialog(context: context, builder: (context){
        return DialogBox(
          controller: _controller,
          onSave: ()=>edittheTask(index),
          onCancel: ()=>Navigator.of(context).pop(),
        );
      }); 

  }

  

  void createNewTask(){
      showDialog(context: context, builder: (context){
        return DialogBox(
          controller: _controller,
          onSave: SaveNewTask,
          onCancel: ()=>Navigator.of(context).pop(),
        );
      });
  }


  void deleteTask(int index){
     
    setState(() {
       toDoList.removeAt(index);
    });

  }


  void checkBoxChanged(bool? value,int index){
  setState(() {
    toDoList[index][1]=!toDoList[index][1];
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title:const Center(child: Text("To do"),
    ),),
    floatingActionButton: FloatingActionButton(
    onPressed: createNewTask,
    child:const Icon(Icons.add)
    ),
      drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                  child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjtwkXiQ7JFi7ZMD78LIz4c860kEP-g2b2cg&usqp=CAU"),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Geethu Ajay"),
                  SizedBox(
                    height: 5,
                  ),
                  Text("geethu@gmail.com")
                ],
              )),
              Text(
                "Google Keep",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              ),
              drawerTile(text: "Notes", iconName: Icons.lightbulb_outline),
              drawerTile(
                  text: "Reminders",
                  iconName: Icons.notifications_none_outlined),
              drawerTile(text: "Create new label", iconName: Icons.add),
              drawerTile(text: "Archive", iconName: Icons.archive_outlined),
              drawerTile(
                  text: "Deleted", iconName: Icons.delete_outline_outlined),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ));
                },
                child: drawerTile(
                    text: "Settings", iconName: Icons.settings_outlined),
              ),
              drawerTile(
                  text: "Help & feedback",
                  iconName: Icons.help_outline_outlined)
            ],
          ),
        ),
      bottomNavigationBar: Container(
          color: Colors.grey.shade900,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.check_box_outlined,
                color: Colors.white54,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(Icons.brush_outlined, color: Colors.white54),
              SizedBox(
                width: 15,
              ),
              Icon(Icons.mic_none_sharp, color: Colors.white54),
              SizedBox(
                width: 15,
              ),
              Icon(Icons.image_outlined, color: Colors.white54),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
    body:Container(
    child:ListView.builder(
      itemCount: toDoList.length,
      itemBuilder: ((context, index) {
        return ToDoList(taskName: toDoList[index][0], taskCompleted: toDoList[index][1], onChanged: (value)=>checkBoxChanged(value,index),deleteFunction: (context)=>deleteTask(index),editFunction: (context)=>editTask(index));
      }),

    )
    ),);

  }
  drawerTile({String? text, IconData? iconName}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        selectedColor: Colors.greenAccent,
        selected: true,
        title: Text(text!),
        leading: Icon(iconName!),
      ),
    );
  }
}

