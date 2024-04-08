import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime? _selectedDay, _focusedDay, _today;

  @override
  void initState() {
    super.initState();
    _today = DateTime.now();
    _selectedDay = _today;
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: _selectedDay!,
      firstDay: DateTime.utc(2014, 1, 1),
      lastDay: DateTime.utc(3024, 12, 31),

      // select date
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}
