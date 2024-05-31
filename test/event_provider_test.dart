import 'package:flutter_test/flutter_test.dart';
import 'package:dotple/model/todo_model.dart';
import 'package:dotple/provider/event_provider.dart';

void main() {
  group('EventProvider', () {
    test('addToEventsList adds todo to events list', () {
      final provider = EventProvider();
      final todo = Todo(
        name: 'Test Todo',
        startDay: DateTime(2024, 5, 30),
        lastDay: DateTime(2024, 5, 30),
      );
      provider.addToEventsList(DateTime(2024, 5, 30), todo);

      expect(provider.eventsList.containsKey(DateTime(2024, 5, 30)), true);
      expect(provider.eventsList[DateTime(2024, 5, 30)]!.contains(todo), true);
    });

    test('removeFromEventsList removes todo from events list', () {
      final provider = EventProvider();
      final todo = Todo(
        name: 'Test Todo',
        startDay: DateTime(2024, 5, 30),
        lastDay: DateTime(2024, 5, 30),
      );
      provider.addToEventsList(DateTime(2024, 5, 30), todo);

      provider.removeFromEventsList(DateTime(2024, 5, 30), todo);
      expect(provider.eventsList.containsKey(DateTime(2024, 5, 30)), false);
    });

    test('removeTodoFromEventsList removes todo from all dates', () {
      final provider = EventProvider();
      final todo = Todo(
        name: 'Test Todo',
        startDay: DateTime(2024, 5, 30),
        lastDay: DateTime(2024, 5, 30),
      );
      provider.addToEventsList(DateTime(2024, 5, 30), todo);
      provider.addToEventsList(DateTime(2024, 5, 31), todo);

      provider.removeTodoFromEventsList(todo);
      expect(provider.eventsList.containsKey(DateTime(2024, 5, 30)), false);
      expect(provider.eventsList.containsKey(DateTime(2024, 5, 31)), false);
    });
  });
}
