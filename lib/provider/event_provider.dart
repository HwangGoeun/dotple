import 'package:dotple/model/todo_model.dart';
import 'package:flutter/material.dart';

class EventProvider with ChangeNotifier {
  final Map<DateTime, List<Todo>> _eventsList = {};
  Map<DateTime, List<Todo>> get eventsList => _eventsList;

  void addToEventsList(DateTime date, Todo todo) {
    if (_eventsList.containsKey(date)) {
      _eventsList[date]!.add(todo);
    } else {
      _eventsList[date] = [todo];
    }
    notifyListeners();
  }

  void removeFromEventsList(DateTime date, Todo todo) {
    if (_eventsList.containsKey(date)) {
      _eventsList[date]!.remove(todo);
      if (_eventsList[date]!.isEmpty) {
        _eventsList.remove(date);
      }
      notifyListeners();
    }
  }

  void removeTodoFromEventsList(Todo todo) {
    final datesToRemove = [];
    _eventsList.forEach((date, todos) {
      todos.removeWhere((t) => t == todo);
      if (todos.isEmpty) {
        datesToRemove.add(date);
      }
    });
    for (var date in datesToRemove) {
      _eventsList.remove(date);
    }
    notifyListeners();
  }
}
