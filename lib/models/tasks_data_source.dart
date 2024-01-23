import 'package:flutter/material.dart';
import 'package:studize/constants/constants.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

List<Appointment> getTasks() {
  List<Appointment> tasks = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime =
      startTime.add(Duration(hours: DefaultSettings.defaultDuration));

  tasks.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Temp String',
      color: Colors.blue));

  return tasks;
}

enum TaskType {
  mathematics,
  physics,
  chemistry,
}

class TasksDataSource extends CalendarDataSource {
  TasksDataSource(List<Appointment> source) {
    appointments = source;
  }
}
