import 'package:flutter/material.dart';
import 'package:studize/components/alert_dialog_box.dart';
import 'package:studize/constants/constants.dart';
import 'package:studize/models/tasks_data_source.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var subjects = [
    'Mathematics',
    'Physics',
    'Chemistry',
  ];

  String dropDownValue = 'Mathematics';

  DateTime _startDateTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    DateTime.now().hour + 1,
  );

  DateTime _endDateTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    DateTime.now().hour + 1 + DefaultSettings.defaultDuration,
  );

  void _showStartDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    ).then((value) {
      setState(() {
        _startDateTime = DateTime(
          value!.year,
          value.month,
          value.day,
          _startDateTime.hour,
          _startDateTime.minute,
        );
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
        _endDateTime = DateTime(
          value!.year,
          value.month,
          value.day,
          _endDateTime.hour,
          _endDateTime.minute,
        );
      });
    });
  }

  TaskType _convertString(String subject) {
    if (subject.compareTo('Mathematics') == 0) return TaskType.mathematics;
    if (subject.compareTo('Physics') == 0) return TaskType.physics;
    if (subject.compareTo('Chemistry') == 0) return TaskType.chemistry;
    throw Error();
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
        _startDateTime = DateTime(
          _startDateTime.year,
          _startDateTime.month,
          _startDateTime.day,
          value!.hour,
          value.minute,
        );
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
        _endDateTime = DateTime(
          _endDateTime.year,
          _endDateTime.month,
          _endDateTime.day,
          value!.hour,
          value.minute,
        );
      });
    });
  }

  String _displayTime(DateTime dateTime) {
    return '${dateTime.hour}:${(dateTime.minute.toString().length == 1) ? '0${dateTime.minute}' : dateTime.minute}';
  }

  String _displayDate(DateTime dateTime) {
    late final String month = StaticConstants.monthList[dateTime.month];
    return '$month ${dateTime.day}, ${dateTime.year}';
  }

  bool _validateDateTime(
    DateTime date1,
    DateTime date2,
  ) {
    if (date2.isBefore(date1)) {
      return false;
    } else {
      if (date1 == date2) return false;
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
            right: 50,
          ),
          child: Table(
            children: [
              TableRow(
                children: [
                  const Text(
                    'Start date',
                    style: TextStyle(fontSize: 20),
                  ),
                  DropdownButton(
                    // Initial Value
                    value: dropDownValue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: subjects.map((String subjects) {
                      return DropdownMenuItem(
                        value: subjects,
                        child: Text(subjects),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropDownValue = newValue!;
                      });
                    },
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
                    'Start date',
                    style: TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () => _showStartDatePicker(),
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder()),
                    child: Text(_displayDate(_startDateTime)),
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
                    child: Text(_displayTime(_startDateTime)),
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
                    child: Text(_displayDate(_endDateTime)),
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
                    child: Text(_displayTime(_endDateTime)),
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
                      if (_validateDateTime(_startDateTime, _endDateTime)) {
                        Task(
                          _convertString(dropDownValue),
                          _startDateTime,
                          _endDateTime,
                        );
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
