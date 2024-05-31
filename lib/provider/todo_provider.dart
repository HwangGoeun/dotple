import 'package:dotple/model/todo_model.dart';
import 'package:flutter/material.dart';

class TodoProvider with ChangeNotifier {
  final List<Todo> _todoList = [];
  final Map<DateTime, List<Todo>> _eventsList = {};

  List<Todo> get todoList => _todoList;
  Map<DateTime, List<Todo>> get eventsList => _eventsList;

  void changeDone(Todo todo) {
    todo.done = !todo.done;
    notifyListeners();
  }

  void updateEventsList(Todo todo) {
    for (DateTime day in todo.todoDays) {
      if (_eventsList[day] == null) {
        _eventsList[day] = [];
      }
      _eventsList[day]!.add(todo);
    }
  }
}
