import 'package:flutter/material.dart';
import 'package:studize/components/alert_dialog_box.dart';
import 'package:studize/constants/constants.dart';

enum TasksType {
  mathematics,
  physics,
  chemistry;
}

class Tasks {
  late TasksType taskType;
  int tasks = 0;
}

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime _startDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    DateTime.now().hour + 1,
  );
  TimeOfDay _startTime = TimeOfDay(
    hour: TimeOfDay.now().hour + 1,
    minute: 0,
  );

  DateTime _endDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    DateTime.now().hour + DefaultSettings.defaultDuration,
  );
  TimeOfDay _endTime = TimeOfDay(
      hour: DateTime.now().hour + 1 + DefaultSettings.defaultDuration,
      minute: 0);

  void _showStartDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    ).then((value) {
      setState(() {
        _startDate = value!;
      });
    });
  }

  void _showEndDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    ).then((value) {
      setState(() {
        _endDate = value!;
      });
    });
  }

  void _showStartTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: TimeOfDay.now().hour + 1,
        minute: 0,
      ),
    ).then((value) {
      setState(() {
        _startTime = value!;
      });
    });
  }

  void _showEndTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: TimeOfDay.now().hour + 1,
        minute: 0,
      ),
    ).then((value) {
      setState(() {
        _endTime = value!;
      });
    });
  }

  String _displayTime(TimeOfDay timeOfDay) {
    return '${timeOfDay.hour}:${(timeOfDay.minute.toString().length == 1) ? '0${timeOfDay.minute}' : timeOfDay.minute}';
  }

  String _displayDate(DateTime dateTime) {
    late final String month = StaticConstants.monthList[dateTime.month];
    return '$month ${dateTime.day}, ${dateTime.year}';
  }

  bool _validateDateTime(
    DateTime date1,
    TimeOfDay time1,
    DateTime date2,
    TimeOfDay time2,
  ) {
    if (date2.isBefore(date1)) {
      return false;
    } else if (date1 == date2) {
      if ((time2.hour - time1.hour) > 0) {
        return true;
      } else if ((time2.hour - time2.hour) == 0) {
        if ((time2.minute - time1.minute) > 0) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add a task'),
          leading: GestureDetector(
            child: const Icon(Icons.close),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 50.0,
            bottom: 20,
            left: 50,
          ),
          child: Table(
            children: [
              TableRow(
                children: [
                  const Text(
                    'Start date',
                    style: TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () => _showStartDatePicker(),
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder()),
                    child: Text(_displayDate(_startDate)),
                  ),
                ],
              ),
              const TableRow(children: [
                SizedBox(height: StaticConstants.tableRowSpacing),
                SizedBox(height: StaticConstants.tableRowSpacing),
              ]),
              TableRow(
                children: [
                  const Text(
                    'Start time',
                    style: TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () => _showStartTimePicker(),
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder()),
                    child: Text(_displayTime(_startTime)),
                  ),
                ],
              ),
              const TableRow(children: [
                SizedBox(height: StaticConstants.tableRowSpacing),
                SizedBox(height: StaticConstants.tableRowSpacing),
              ]),
              TableRow(
                children: [
                  const Text(
                    'End date',
                    style: TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () => _showEndDatePicker(),
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder()),
                    child: Text(_displayDate(_endDate)),
                  ),
                ],
              ),
              const TableRow(children: [
                SizedBox(height: StaticConstants.tableRowSpacing),
                SizedBox(height: StaticConstants.tableRowSpacing),
              ]),
              TableRow(
                children: [
                  const Text(
                    'End time',
                    style: TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () => _showEndTimePicker(),
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder()),
                    child: Text(_displayTime(_endTime)),
                  ),
                ],
              ),
              const TableRow(children: [
                SizedBox(height: StaticConstants.tableRowSpacing),
                SizedBox(height: StaticConstants.tableRowSpacing),
              ]),
              TableRow(
                children: [
                  ElevatedButton(
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  ElevatedButton(
                    child: const Text(
                      'Add task',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      if (_validateDateTime(
                          _startDate, _startTime, _endDate, _endTime)) {
                        //TODO: Implement add task
                      } else {
                        showAlertDialog(
                          context: context,
                          title: 'Invalid Input!',
                          text: 'Please enter a valid input.',
                        );
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
