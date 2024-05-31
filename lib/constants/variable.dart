// import 'package:dotple/screens/todo/todo.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// late var screenHeight;
// late var screenWidth;

// class Category {
//   late String name;
//   ColorSwatch? color;
//   List<Category> todoList = [];

//   Category({
//     required this.name,
//     this.color = Colors.red,
//   });
// }

// class Todo {
//   late String name, iterate;
//   late DateTime firstDay, lastDay;
//   late Category category;

//   Todo({
//     required this.name,
//     required this.category,
//     required this.firstDay,
//     required this.lastDay,
//     required this.iterate,
//   });
// }

// class TodoTemp {
//   late String name;

//   TodoTemp({
//     required this.name,
//   });
// }

// List<Category> categoryList = [
//   Category(name: "카테고리 1"),
//   Category(
//     name: "카테고리 2",
//     color: Colors.amber,
//   )
// ];

// Category category1 = Category(name: "운동");
// Todo todo1 = Todo(
//   name: "수영",
//   category: category1,
//   firstDay: DateTime.now(),
//   lastDay: DateTime(2024, 4, 30, 17, 30),
//   iterate: "Date",
// );

// // Map<DateTime, List<Todo>> eventsList = {};
// Map<DateTime, List<TodoTemp>> eventsList = {};
