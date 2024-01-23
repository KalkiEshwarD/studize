import 'package:studize/constants/constants.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

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

class Task {
  late TaskType taskType;
  late DateTime startDateTime;
  late DateTime endDateTime;

  static int mathTasks = 0;
  static int phyTasks = 0;
  static int chemTasks = 0;

  static List<Appointment> tasks = <Appointment>[];

  static List<Appointment> getTasks() {
    return tasks;
  }

  Task(this.taskType, this.startDateTime, this.endDateTime) {
    String subject = 'Mathematics';

    if (taskType == TaskType.mathematics) {
      mathTasks++;
      subject = 'Mathematics';
    } else if (taskType == TaskType.physics) {
      phyTasks++;
      subject = 'Physics';
    } else if (taskType == TaskType.chemistry) {
      chemTasks++;
      subject = 'Chemistry';
    } else {
      throw Error();
    }

    tasks.add(
      Appointment(
        startTime: startDateTime,
        endTime: endDateTime,
        subject: subject,
        color: DefaultSettings.defaultColor,
      ),
    );
  }
}
