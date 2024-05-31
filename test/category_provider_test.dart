import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dotple/provider/category_provider.dart';
import 'package:dotple/model/category_model.dart';
import 'package:dotple/model/todo_model.dart';

void main() {
  test('Add category test', () {
    // Arrange
    CategoryProvider provider = CategoryProvider();
    const String categoryName = 'Test Category';
    const ColorSwatch categoryColor = Colors.blue;

    // Act
    provider.addCategory(categoryName, categoryColor);

    // Assert
    expect(provider.categoryList.length, 1);
    expect(provider.categoryList.first.name, categoryName);
    expect(provider.categoryList.first.color, categoryColor);
  });

  test('Delete category test', () {
    // Arrange
    CategoryProvider provider = CategoryProvider();
    const String categoryName = 'Test Category';
    const ColorSwatch categoryColor = Colors.blue;
    provider.addCategory(categoryName, categoryColor);

    // Act
    provider.deleteCategory(categoryName);

    // Assert
    expect(provider.categoryList.length, 0);
  });

  test('Add todo in category test', () {
    // Arrange
    CategoryProvider provider = CategoryProvider();
    const String categoryName = 'Test Category';
    const ColorSwatch categoryColor = Colors.blue;
    const String todoName = 'Test Todo';
    const bool todoDone = false;
    provider.addCategory(categoryName, categoryColor);

    // Act
    provider.addTodoInCategory(
      provider.categoryList.first,
      Todo(
        name: todoName,
        done: todoDone,
        startDay: DateTime.now(),
        lastDay: DateTime.now(),
      ),
    );

    // Assert
    expect(provider.categoryList.first.todoList.length, 1);
    expect(provider.categoryList.first.todoList.first.name, todoName);
    expect(provider.categoryList.first.todoList.first.done, todoDone);
  });

  test('Delete todo in category test', () {
    // Arrange
    CategoryProvider provider = CategoryProvider();
    const String categoryName = 'Test Category';
    const ColorSwatch categoryColor = Colors.blue;
    const String todoName = 'Test Todo';
    const bool todoDone = false;
    provider.addCategory(categoryName, categoryColor);
    provider.addTodoInCategory(
      provider.categoryList.first,
      Todo(
        name: todoName,
        done: todoDone,
        startDay: DateTime.now(),
        lastDay: DateTime.now(),
      ),
    );

    // Act
    provider.deleteTodoInCategory(
      provider.categoryList.first,
      provider.categoryList.first.todoList.first,
    );

    // Assert
    expect(provider.categoryList.first.todoList.length, 0);
  });
}
