import 'package:flutter/material.dart';
import 'package:studize/components/drawer.dart';
import 'package:studize/constants/constants.dart';
import 'package:studize/models/tasks_data_source.dart';

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
        body: Padding(
          padding: const EdgeInsets.only(
            top: 50.0,
            bottom: 20,
            left: 50,
            right: 50,
          ),
          child: Table(
            children: [
              TableRow(
                children: [
                  const Text(
                    'Mathematics tasks: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '${Task.mathTasks}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  SizedBox(height: StaticConstants.tableRowSpacing),
                  SizedBox(height: StaticConstants.tableRowSpacing),
                ],
              ),
              TableRow(
                children: [
                  const Text(
                    'Physics tasks: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '${Task.phyTasks}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const Text(
                    'Chemistry tasks: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '${Task.chemTasks}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  SizedBox(height: StaticConstants.tableRowSpacing),
                  SizedBox(height: StaticConstants.tableRowSpacing),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
