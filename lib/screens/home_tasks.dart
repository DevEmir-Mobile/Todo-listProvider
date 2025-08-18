import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_provider/providers/tasks_provider.dart';
import 'package:todolist_provider/screens/add_task.dart';

class HomeTasks extends StatefulWidget {
  const HomeTasks({super.key});

  @override
  State<HomeTasks> createState() => _HomeTasksState();
}

class _HomeTasksState extends State<HomeTasks> {
  @override
  Widget build(BuildContext context) {
    final _taskProvider = Provider.of<TasksProvider>(context);
  
    void capturarTarea() async {
      final nuevaTarea = await Navigator.push(context, MaterialPageRoute(builder: (context) => AddTask()));
      if(nuevaTarea != null){
        _taskProvider.addTask("categoria", nuevaTarea);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tareas "),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _taskProvider.tasks.length,
       itemBuilder: (context, index) {
        return _taskProvider.tasks.isEmpty ? SizedBox() : ListTile(
          title: Text(_taskProvider.tasks[index].title, style: TextStyle(
            decoration: _taskProvider.tasks[index].isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
            fontSize: 22,
          )),
          leading: Checkbox(
            tristate: false,
            value: _taskProvider.tasks[index].isCompleted, 
            onChanged: (bool? value) {
              setState(() {
              _taskProvider.tasks[index].isCompleted = value!;
              });
          }),
          onTap: () async {
           
          },
        ); 
       
       }
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: capturarTarea,
        child: Icon(Icons.add),
      ),
    );
  }
}