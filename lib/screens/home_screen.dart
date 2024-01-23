import 'package:flutter/material.dart';
import 'package:studize/components/drawer.dart';
import 'package:studize/constants/routes.dart';
import 'package:studize/models/tasks_data_source.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static CalendarView currentCalendarView = CalendarView.day;

  static bool _validCalendarView(CalendarView calendarView) {
    if (calendarView == CalendarView.day) return true;
    if (calendarView == CalendarView.week) return true;
    if (calendarView == CalendarView.month) return true;
    return false;
  }

  static setCalendarView(CalendarView calendarView) {
    if (_validCalendarView(calendarView)) {
      currentCalendarView = calendarView;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My calendar'),
        ),
        drawer: primaryDrawer(context),
        body: SfCalendar(
          allowedViews: const [
            CalendarView.day,
            CalendarView.week,
            CalendarView.month
          ],
          view: currentCalendarView,
          firstDayOfWeek: 1,
          dataSource: TasksDataSource(getTasks()),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, addTaskScreen);
          },
          child: const Icon(Icons.add_task_sharp),
        ),
      ),
    );
  }
}
