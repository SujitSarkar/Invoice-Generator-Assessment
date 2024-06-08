import 'package:flutter/material.dart';

import '../../src/features/reservation/model/duration_model.dart';

Future<DateTime?> pickDateTime(BuildContext context) async {
  // Pick a date
  DateTime? date = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(DateTime.now().add(const Duration(days: 366)).year),
  );

  if (date == null) {
    return null;
  }

  // Pick a time
  TimeOfDay? time = await showTimePicker(
    // ignore: use_build_context_synchronously
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (time == null) {
    return null;
  }

  // Combine the date and time into a DateTime object
  final dateTime = DateTime(
    date.year,
    date.month,
    date.day,
    time.hour,
    time.minute,
  );

  return dateTime;
}

DurationModel calculateDateDifference(
    {required DateTime pickupDate, required DateTime returnDate}) {
  final duration = returnDate.difference(pickupDate);

  final weeks = duration.inDays ~/ 7;
  final days = duration.inDays % 7;
  int hours = duration.inHours % 24;
  // Add an extra hour if there are remaining minutes
  if (duration.inMinutes % 60 > 0) {
    hours += 1;
  }

  return DurationModel(week: weeks, day: days, hour: hours);
}
