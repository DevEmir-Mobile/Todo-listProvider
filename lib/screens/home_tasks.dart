import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_provider/providers/tasks_provider.dart';
import 'package:todolist_provider/screens/add_task.dart';
import 'package:todolist_provider/screens/edit_task.dart';

class HomeTasks extends StatefulWidget {
  const HomeTasks({super.key});

  @override
  State<HomeTasks> createState() => _HomeTasksState();
}

class _HomeTasksState extends State<HomeTasks> with SingleTickerProviderStateMixin{
  late TabController _tabController;

    @override
    void initState() {
      super.initState();
      _tabController = TabController(length: 3, vsync: this);
      _tabController.addListener(() {
        if(!_tabController.indexIsChanging){
          context.read<TasksProvider>().setSelectedIndex(_tabController.index);
        }
      });
    }

    @override
    void dispose() {
      _tabController.dispose();
      super.dispose();

      
    }
    
  @override
  Widget build(BuildContext context) {
    final _taskProvider = Provider.of<TasksProvider>(context);
    

    void capturarTarea() async {
      final nuevaTarea = await Navigator.push(context, MaterialPageRoute(builder: (context) => AddTask()));
      if(nuevaTarea != null){
        _taskProvider.addTask(nuevaTarea);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tareas "),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
          Tab(text: "Todas"),
          Tab(text: "Completadas"),
          Tab(text: "Pendientes"),
        ]),
      ),
      
      body: TabBarView(
        controller: _tabController,
        children: [
        tasksBuilder(_taskProvider),
        tasksBuilder(_taskProvider),
        tasksBuilder(_taskProvider),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: capturarTarea,
        child: Icon(Icons.add),
      ),
    );
  }

  ListView tasksBuilder(TasksProvider _taskProvider) {
    return ListView.builder(
      itemCount: _taskProvider.filteredTasks.length,
     itemBuilder: (context, index) {
      return _taskProvider.filteredTasks.isEmpty ? SizedBox() : ListTile(
        title: Text(_taskProvider.filteredTasks[index].title, style: TextStyle(
          decoration: _taskProvider.filteredTasks[index].isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
          fontSize: 22,
        )),
        leading: Checkbox(
          tristate: false,
          value: _taskProvider.filteredTasks[index].isCompleted, 
          onChanged: (bool? value) {
            setState(() {
            _taskProvider.filteredTasks[index].isCompleted = value!;
            });
        }),
        onTap: () async {
         final nuevaTarea = await Navigator.push(context, MaterialPageRoute(builder: (context) => EditTask(taskId: _taskProvider.filteredTasks[index].id, currentTitle: _taskProvider.filteredTasks[index].title,)));
         if(nuevaTarea != null){

         _taskProvider.updateTask(_taskProvider.filteredTasks[index].id, nuevaTarea);
         }
        },
        trailing: IconButton(onPressed: () {
          showDialog(context: context, builder: (context) {
            return AlertDialog(
              title: Text("¿Deseas eliminar la tarea?"),
              actions: [
                ElevatedButton(onPressed: () {
                  _taskProvider.deleteTask(index);
                  Navigator.pop(context, true);
                },
                 child: Text("Confirmar")),
                ElevatedButton(onPressed: () {
                  
                },
                 child: Text("Cancelar"))
              ],

            );
          },
          );
        },
         icon: Icon(Icons.delete)),
      ); 
     
     }
      
    );
  }
}