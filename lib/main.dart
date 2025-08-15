import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_provider/providers/tasks_provider.dart';
import 'package:todolist_provider/screens/home_tasks.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TasksProvider())
  ],
    child: const MyApp(),
  )
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: HomeTasks(),
    );
  }
}

