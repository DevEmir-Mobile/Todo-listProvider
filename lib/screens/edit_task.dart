import 'package:flutter/material.dart';


class EditTask extends StatefulWidget {
  final String? currentTitle;
  const EditTask({super.key, this.currentTitle});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  @override
  Widget build(BuildContext context) {
      final TextEditingController _taskEditController = TextEditingController(text: widget.currentTitle);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Editar tarea", style: TextStyle(
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
              controller: _taskEditController,
              decoration: InputDecoration(
                hintText: "Ingresa el nombre de la tarea a editar: ",
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
                  Navigator.pop(context, _taskEditController.text);                
                  
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