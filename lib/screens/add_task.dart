import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _taskController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
      //final _taskProvider = Provider.of<TasksProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Agrega una tarea", style: TextStyle(
          color: Colors.white
        )),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 300),
            child: TextField(
              controller: _taskController,
              decoration: InputDecoration(
                hintText: "Ingresa el nombre de la tarea",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 200),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: FloatingActionButton(
                onPressed: () {
                setState(() {
                  Navigator.pop(context, _taskController.text);                
                  
                },
                
                );
              },
              child: Text("Guardar tarea", style: TextStyle(
                fontSize: 22,
                color: Colors.white
              ),),
              ),
            ),
          )
        ],
      ),
    );
  }
}