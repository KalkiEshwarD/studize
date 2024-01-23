import 'package:flutter/material.dart';
import 'package:studize/constants/constants.dart';

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
    return '${timeOfDay.hour}:00';
  }

  String _displayDate(DateTime dateTime) {
    late final String month = StaticConstants.monthList[dateTime.month];
    return '$month ${dateTime.day}, ${dateTime.year}';
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
                    child: Text(_displayDate(_startDate)),
                    // style: ElevatedButton.styleFrom(
                    //     shape: const RoundedRectangleBorder()),
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
                    child: Text(_displayTime(_startTime)),
                    // style: ElevatedButton.styleFrom(
                    //     shape: const RoundedRectangleBorder()),
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
                    child: Text(_displayDate(_endDate)),
                    // style: ElevatedButton.styleFrom(
                    //     shape: const RoundedRectangleBorder()),
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
                    child: Text(_displayTime(_endTime)),
                    // style: ElevatedButton.styleFrom(
                    //     shape: const RoundedRectangleBorder()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Row(
//               children: [
//                 const Column(
//                   children: [
                   
                    // Text(
//                       'Start time',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ],
//                 ),
//                 const Padding(padding: EdgeInsets.only(right: 50)),
//                 Column(
//                   children: [
                    
//                   ],
//                 )
//               ],
//             ),
