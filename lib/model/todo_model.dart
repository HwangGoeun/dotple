import 'package:dotple/model/todo_model.dart';
import 'package:flutter/material.dart';

class Todo {
  late String name;
  DateTime startDay;
  DateTime lastDay;
  late List<DateTime> todoDays = [];
  bool done = false;

  Todo({
    required this.name,
    required this.startDay,
    required this.lastDay,
    this.done = false,
  }) {
    _generateTodoDays();
  }

  void _generateTodoDays() {
    todoDays = [];
    for (DateTime day = startDay;
        day.isBefore(lastDay) || day.isAtSameMomentAs(lastDay);
        day = day.add(const Duration(days: 1))) {
      todoDays.add(day);
    }
  }
}
