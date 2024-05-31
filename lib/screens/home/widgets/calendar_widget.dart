// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:collection';

import 'package:dotple/constants/constants.dart';
import 'package:dotple/model/category_model.dart';
import 'package:dotple/model/todo_model.dart';
import 'package:dotple/provider/category_provider.dart';
import 'package:dotple/screens/todo/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class Event {
  DateTime date;
  String title;
  bool complete = false;
  late Color makerColor;

  Event({
    required this.date,
    required this.title,
  });
}

class _CalendarState extends State<Calendar> {
  DateTime? _selectedDay, _focusedDay, _today;
  final Map<DateTime, List> _eventsList = {};
  // Map<DateTime, String>

  @override
  void initState() {
    super.initState();
    // print(DateTime.now());
    _today = DateTime.now();
    _selectedDay = _today;
  }

  @override
  Widget build(BuildContext context) {
    int getHashCode(DateTime key) {
      return key.day * 1000000 + key.month * 10000 + key.year;
    }

    final _events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventsList);

    List getEventForDay(DateTime day) {
      return _events[day] ?? [];
    }

    List<Category> _categoryList =
        context.watch<CategoryProvider>().categoryList;

    return Column(
      children: [
        TableCalendar(
          focusedDay: _selectedDay!,
          firstDay: DateTime.utc(2014, 1, 1),
          lastDay: DateTime.utc(3024, 12, 31),
          eventLoader: getEventForDay,

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
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
          ),
        ),

        // start of todo list
        Container(
          decoration: const BoxDecoration(
            color: Colors.amber,
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: _categoryList
                .map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: screenWidth * 0.95,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 196, 196, 196),
                              borderRadius: BorderRadius.all(
                                Radius.circular(9),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 15.0,
                                top: 8,
                                bottom: 8,
                              ),
                              child: Text(
                                e.name,
                                style: TextStyle(
                                  fontSize: screenWidth / 20,
                                ),
                              ),
                            ),
                          ),
                          // ListTile(
                          //   // key: const Key('why'),
                          //   title: const Text('할 일 1'),
                          //   leading: Icon(
                          //     Icons.circle,
                          //     color: e.color!.withOpacity(0.5),
                          //   ),
                          //   trailing: IconButton(
                          //     icon: const Icon(Icons.menu),
                          //     onPressed: () {},
                          //   ),
                          //   onTap: () {},
                          // ),

                          ListTile(
                            key: const Key('add_button'),
                            title: const Text('추가하기'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TodoScreen(),
                                ),
                              );
                            },
                          ),
                          // ListView(
                          //   shrinkWrap: true,
                          //   children: getEventForDay(_selectedDay!)
                          //       .map((e) => Container(
                          //             child: ListView(
                          //               children: [
                          //                 ListTile(
                          //                   title: Text(e.toString()),
                          //                 ),
                          //                 Container(
                          //                   width: screenHeight * 0.2,
                          //                   height: screenHeight * 0.1,
                          //                   decoration: const BoxDecoration(
                          //                       color: Colors.amber),
                          //                 )
                          //               ],
                          //             ),
                          //           ))
                          //       .toList(),
                          // )
                        ],
                      ),
                    ))
                .toList(),
          ),
        ), // end of todo list
      ],
    );
  }
}
