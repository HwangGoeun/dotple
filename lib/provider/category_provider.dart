import 'package:dotple/model/category_model.dart';
import 'package:dotple/model/todo_model.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  final List<Category> _categoryList = [];
  final List<Category> _deleteCategoryList = [];
  List<Category> get categoryList => _categoryList;
  List<Category> get deleteCategoryList => _deleteCategoryList;

  void addCategory(String categoryName, ColorSwatch categoryColor) {
    _categoryList.add(Category(
      name: categoryName,
      color: categoryColor,
    ));
    notifyListeners();
  }

  void deleteCategory(String categoryName) {
    _categoryList.removeWhere((category) => category.name == categoryName);
    notifyListeners();
  }

  void addTodoInCategory(Category category, Todo todo) {
    category.todoList.add(todo);
    notifyListeners();
  }

  void deleteTodoInCategory(Category category, Todo todo) {
    category.todoList.remove(todo);
    notifyListeners();
  }
}
