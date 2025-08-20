import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist_provider/models/taks_models.dart';
class TasksProvider with ChangeNotifier{
  final List<TaksModels> _tasks= [];



  List<TaksModels> get tasks => _tasks;
   List<TaksModels> get completedTask {
    return _tasks.where((task) => task.isCompleted).toList();
  }
   List<TaksModels> get incompleteTask {
    return _tasks.where((task) => !task.isCompleted).toList();
  }

  int _selectedTabindex = 0;
 
  int get selectedTabindex => _selectedTabindex;

  void setSelectedIndex(int index){
    _selectedTabindex = index;
    notifyListeners();
  }

  List<TaksModels> get filteredTasks {
    switch (_selectedTabindex) {
      case 1:
        return completedTask;
      case 2:
        return incompleteTask;
      default:
        return tasks;
    }
  }

 


  
  void addTask (String title){
    final newTask = TaksModels(id: DateTime.now().toString(), title: title);
    _tasks.add(newTask);
    notifyListeners();
  }
  void deleteTask(int index){
    _tasks.removeAt(index);
    notifyListeners();
  }
  void updateTask(String id, String newTitle){
    final taskIndex = tasks.indexWhere((task) => task.id == id);
    if(taskIndex != -1){
      _tasks[taskIndex].title = newTitle;
      notifyListeners();

    }
  }

 
}