import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist_provider/models/taks_models.dart';
//Ahi que modificar este provider. Hay fallas en la implementancion de la logica que queremos llegar.
class TasksProvider with ChangeNotifier{
  final List<TaksModels> _tasks= [];

  List<TaksModels> get tasks => _tasks;
  
  void addTask(String category, String title){
    final newTask = TaksModels(id: DateTime.now().toString(), category: category, title: title);
    _tasks.add(newTask);
    notifyListeners();
    print("Total tareas: ${_tasks.length}"); // Y esto también

  }

  void toggleTaskStatus(String id){
    final taskIndex = tasks.indexWhere((task) => task == task.id);
    if(taskIndex != -1){
      _tasks[taskIndex].isCompleted = !_tasks[taskIndex].isCompleted;
      notifyListeners();

    }
  }

 
}