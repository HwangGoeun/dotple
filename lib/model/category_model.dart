import 'package:dotple/model/todo_model.dart';
import 'package:flutter/material.dart';

class Category {
  late String name;
  ColorSwatch? color;
  late List<Todo> todoList = [];
  bool checked = false;

  Category({
    required this.name,
    this.color = Colors.red,
    this.checked = false,
  });
}
