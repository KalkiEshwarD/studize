import 'package:flutter/material.dart';
import 'package:studize/components/drawer.dart';

class TasksOverviewScreen extends StatefulWidget {
  const TasksOverviewScreen({super.key});

  @override
  State<TasksOverviewScreen> createState() => _TasksOverviewScreenState();
}

class _TasksOverviewScreenState extends State<TasksOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tasks'),
        ),
        drawer: primaryDrawer(context),
      ),
    );
  }
}
