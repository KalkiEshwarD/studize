import 'package:flutter/material.dart';
import 'package:studize/screens/about_screen.dart';
import 'package:studize/screens/add_task_screen.dart';
import 'package:studize/screens/home_screen.dart';
import 'package:studize/screens/tasks_overview_screen.dart';

const homeScreen = '/home-screen';
const signInScreen = '/sign-in-screen';
const signUpScreen = '/sign-up-screen';
const aboutScreen = '/about-us-screen';
const tasksOverviewScreen = '/tasks-overview-screen';
const addTaskScreen = '/add-task-screen';

Map<String, Widget Function(BuildContext)> routesMap = {
  homeScreen: (context) => const HomeScreen(),
  aboutScreen: (context) => const AboutScreen(),
  tasksOverviewScreen: (context) => const TasksOverviewScreen(),
  addTaskScreen: (context) => const AddTaskScreen(),
};
