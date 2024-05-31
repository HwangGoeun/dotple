import 'package:dotple/provider/category_provider.dart';
import 'package:dotple/provider/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TodoProvider', () {
    late TodoProvider todoProvider;

    setUp(() {
      todoProvider = TodoProvider();
    });

    test('Initial categories list should be empty', () {
      expect(todoProvider.todoList.isEmpty, true);
    });
  });
}
