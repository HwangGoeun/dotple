// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:collection';

import 'package:dotple/constants/constants.dart';
import 'package:dotple/model/category_model.dart';
import 'package:dotple/model/event.dart';
import 'package:dotple/model/todo_model.dart';
import 'package:dotple/provider/category_provider.dart';
import 'package:dotple/provider/event_provider.dart';
import 'package:dotple/provider/todo_provider.dart';
import 'package:dotple/screens/todo/todo_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

enum MenuType {
  edit,
  delete,
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
  late MenuType _selectedMenu;
  final List _categoryList = [];

  @override
  void initState() {
    super.initState();
    // print(DateTime.now());
    _today = DateTime.now();
    _selectedDay = _today;
  }

  @override
  Widget build(BuildContext context) {
    final Map<DateTime, List<Todo>> _eventsList =
        Provider.of<EventProvider>(context).eventsList;
    // final _eventsList = {
    //   DateTime.now(): [
    //     Todo(
    //       name: "1",
    //       startDay: DateTime.now(),
    //       lastDay: DateTime.now(),
    //     )
    //   ],
    //   // DateTime(2024, 5, 24): [
    //   //   Todo(
    //   //     name: "1",
    //   //     startDay: DateTime(2024, 5, 22),
    //   //     lastDay: DateTime(2024, 5, 23),
    //   //   )
    //   // ],
    // };

    // Map<DateTime, List<Todo>> _eventsList =
    //     context.watch<TodoProvider>().eventsList;
    // Print the _eventsList to see the result

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

    return Expanded(
      child: Container(
        // decoration: const BoxDecoration(color: Colors.yellow),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
              child: TableCalendar(
                focusedDay: _selectedDay!,
                firstDay: DateTime.utc(2014, 1, 1),
                lastDay: DateTime.utc(3024, 12, 31),
                eventLoader: getEventForDay,

                // select date
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  print(_eventsList);
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

                // calendar size
                rowHeight: screenHeight * 0.09,

                // calendar decoration
                calendarStyle: CalendarStyle(
                  // setting for all days
                  cellMargin: const EdgeInsets.all(2),
                  cellAlignment: Alignment.topLeft,
                  cellPadding: const EdgeInsets.only(left: 2.5),

                  // weekdays
                  defaultDecoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffc2c2c2),
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),

                  // weekends
                  weekendDecoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffc2c2c2),
                    ),
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xfff6f6f6),
                  ),

                  // today
                  todayDecoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  todayTextStyle: const TextStyle(
                    color: Colors.black,
                  ),

                  // selected day
                  selectedDecoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.amber,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  selectedTextStyle: const TextStyle(
                    color: Colors.black,
                  ),

                  // others
                  outsideDecoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffc2c2c2),
                    ),
                    borderRadius: BorderRadius.circular(3.8),
                  ),
                ),
                // calendarBuilders: CalendarBuilders(
                //   markerBuilder: (context, date, events) {
                //     // events는 해당 날짜에 등록된 Todo 리스트입니다.  // events는 해당 날짜에 등록된 Todo 리스트입니다.
                //     final markerCount = events.length;
                //     if (markerCount > 0) {
                //       return Container(
                //         width: screenWidth * 0.05,
                //         // height: 16,
                //         decoration: BoxDecoration(
                //           color: Colors.blue,
                //           shape: BoxShape.circle,
                //           border: Border.all(color: Colors.white, width: 2),
                //         ),
                //         child: const Center(
                //             // child: Text(
                //             //   markerCount.toString(),
                //             //   style: const TextStyle(
                //             //     color: Colors.white,
                //             //     fontSize: 10,
                //             //     fontWeight: FontWeight.bold,
                //             //   ),
                //             // ),
                //             ),
                //       );
                //     } else {
                //       return const SizedBox.shrink(); // 일정이 없는 경우 마커를 표시하지 않음
                //     }
                // },
                // // markerBuilder를 사용하여 날짜에 마커를 추가합니다.
                // markerBuilder: (context, date, events) {
                //   print(events);
                //   if (events.isNotEmpty) {
                //     return Container(
                //       width: screenWidth * 0.02,
                //       // height: 16,
                //       decoration: const BoxDecoration(
                //         color: Colors.red, // Marker color 설정
                //         shape: BoxShape.circle,
                //       ),
                //     );
                //   }
                //   return Container();
                // },
                // ),
              ),
            ),

            // start of list
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: _categoryList
                      .map((categoryItem) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  width: screenWidth * 0.95,
                                  decoration: BoxDecoration(
                                    color: categoryItem.color!.withOpacity(0.2),
                                    // color: Color.fromARGB(255, 196, 196, 196),
                                    borderRadius: const BorderRadius.all(
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
                                      categoryItem.name,
                                      style: TextStyle(
                                        fontSize: screenWidth / 20,
                                      ),
                                    ),
                                  ),
                                ),

                                // start of showing todo list tiles
                                Column(
                                  children:
                                      categoryItem.todoList.map((todoItem) {
                                    return ListTile(
                                      onTap: () {
                                        context
                                            .read<TodoProvider>()
                                            .changeDone(todoItem);

                                        _eventsList[DateTime.now()] = [
                                          Todo(
                                            name: todoItem.name,
                                            startDay: DateTime.now(),
                                            lastDay: DateTime.now(),
                                          )
                                        ]; // 이벤트를 갱신합니다.
                                        context
                                            .read<EventProvider>()
                                            .addToEventsList(
                                                DateTime.now(), todoItem);

                                        setState(() {});
                                        // print(_eventsList.values);
                                        // setState(() {});
                                      },
                                      leading: Icon(
                                        Icons.circle,
                                        color: todoItem.done
                                            ? categoryItem.color
                                            : categoryItem.color!
                                                .withOpacity(0.5),
                                      ),
                                      title: Text(
                                        todoItem.name,
                                        style: TextStyle(
                                          color: todoItem.done
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ),

                                      // start of hamburger menu
                                      trailing: PopupMenuButton<MenuType>(
                                        onSelected: (MenuType select) {
                                          setState(() {
                                            _selectedMenu = select;
                                          });
                                        },
                                        itemBuilder: (BuildContext context) {
                                          return <PopupMenuEntry<MenuType>>[
                                            PopupMenuItem(
                                              value: MenuType.edit,
                                              child: const Text("수정하기"),
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        TodoScreen(
                                                            todo: todoItem),
                                                  ),
                                                );
                                              },
                                            ),
                                            PopupMenuItem(
                                              value: MenuType.delete,
                                              child: const Text("삭제하기"),
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      content: const Text(
                                                        "할 일을 삭제하겠습니다? 삭제된 후에는 복구할 수 없습니다.",
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child:
                                                              const Text("취소"),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                            context
                                                                .read<
                                                                    CategoryProvider>()
                                                                .deleteTodoInCategory(
                                                                    categoryItem,
                                                                    todoItem);

                                                            // eventsList에서 해당 이벤트 삭제
                                                            context
                                                                .read<
                                                                    EventProvider>()
                                                                .removeTodoFromEventsList(
                                                                    todoItem);

                                                            setState(() {});
                                                          },
                                                          child:
                                                              const Text("삭제"),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ];
                                        },
                                      ),
                                      // end of hamburger menu
                                    );
                                  }).toList(),
                                ),
                                // end of showing todo list tiles

                                // start of add Todo button
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
                                // end of add Todo button

                                // ...getEventForDay(_selectedDay!)
                                //     .map((e) => Container(
                                //           child: Column(
                                //             // 수정: 내부 ListView를 Column으로 변경
                                //             children: [
                                //               ListTile(
                                //                 title: Text(e.toString()),
                                //               ),
                                //               Container(
                                //                 width: screenHeight * 0.2,
                                //                 height: screenHeight * 0.1,
                                //                 decoration: const BoxDecoration(
                                //                     color: Colors.amber),
                                //               ),
                                //             ],
                                //           ),
                                //         )),
                              ],
                            ),
                          ))
                      .toList(),
                ), // end of showing category block
              ),
            ), // end of list
          ],
        ),
      ),
    );
  }
}
