// ignore_for_file: no_leading_underscores_for_local_identifiers, sized_box_for_whitespace, prefer_final_fields, unused_field

import 'package:dotple/constants/constants.dart';
import 'package:dotple/constants/variable.dart';
import 'package:dotple/model/category_model.dart';
import 'package:dotple/model/todo_model.dart';
import 'package:dotple/provider/category_provider.dart';
import 'package:dotple/provider/event_provider.dart';
import 'package:dotple/provider/todo_provider.dart';
import 'package:dotple/screens/home/home.dart';
import 'package:dotple/screens/todo/widgets/day_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget {
  Todo? todo;

  TodoScreen({
    super.key,
    this.todo,
  });

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

enum Iterate { number, day }

enum Days { Mon, Tue, Wed, Thu, Fri, Sat, Sun }

class _TodoScreenState extends State<TodoScreen> {
  late String _todoName;
  Category? _todoCategory;
  final Iterate _todoIterate = Iterate.number;
  DateTime _todoFirstDay = DateTime.now(), _todoLastDay = DateTime.now();

  Future<DateTime?> openDatePicker() async {
    DateTime? date;
    date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2125),
    );

    return date;
  }

  Iterate _iterate = Iterate.number;
  Days _day = Days.Mon;

  @override
  Widget build(BuildContext context) {
    List<Category> _categoryList =
        context.watch<CategoryProvider>().categoryList;

    return Scaffold(
      appBar: AppBar(
        title: const Text("할 일 추가/수정"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // decoration: const BoxDecoration(color: Colors.amber),
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Column(
              children: [
                // select Category
                Container(
                  // decoration: const BoxDecoration(color: Colors.red),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // decoration: const BoxDecoration(color: Colors.black),
                        child: const Text("카테고리"),
                      ),
                      SizedBox(
                        width: screenWidth * 0.75,
                        child: DropdownButton<Category>(
                          isExpanded: true,
                          value: _todoCategory,
                          onChanged: (Category? value) {
                            setState(() {
                              _todoCategory = value!;
                            });
                          },
                          items: _categoryList.map((Category category) {
                            return DropdownMenuItem<Category>(
                              value: category,
                              child: Text(category.name.toString()),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ), // end of select category

                // todo name
                Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("할 일 이름"),
                      TextFormField(
                        onChanged: (value) {
                          _todoName = value;
                        },
                      ),
                    ],
                  ),
                ), // end of todo name

                // iterate setting
                Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("반복 설정"),

                      // start of start day setting
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("시작일"),
                          TextButton(
                            onPressed: () async {
                              DateTime? date = await openDatePicker();
                              setState(() {
                                _todoFirstDay = date!;
                              });
                            },
                            child:
                                Text(_todoFirstDay.toString().substring(0, 10)),
                          ),
                        ],
                      ), // end of start day setting

                      // start of last day setting
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("종료일"),
                          TextButton(
                            onPressed: () async {
                              DateTime? date = await openDatePicker();
                              setState(() {
                                _todoLastDay = date!;
                              });
                            },
                            child:
                                Text(_todoLastDay.toString().substring(0, 10)),
                          ),
                        ],
                      ), // end of last day setting

                      // start of iteration mode setting
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            // start of 횟수
                            Expanded(
                              child: RadioListTile(
                                title: const Text("횟수"),
                                value: Iterate.number,
                                groupValue: _iterate,
                                onChanged: (value) {
                                  setState(() {
                                    _iterate = value!;
                                  });
                                },
                              ),
                            ),
                            // end of 횟수

                            // start of 요일
                            Expanded(
                              child: RadioListTile(
                                title: const Text("요일"),
                                value: Iterate.day,
                                groupValue: _iterate,
                                onChanged: (Iterate? value) {
                                  setState(() {
                                    _iterate = value!;
                                  });
                                },
                              ),
                            ),
                            // end of 요일
                          ],
                        ),
                      ), // end of iteration setting mode

                      // start of 반복 세부 설정
                      _iterate == Iterate.number
                          ?
                          // start of 횟수 세부 설정
                          Container(
                              margin: const EdgeInsets.only(top: 10),
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: screenWidth * 0.3),
                              // width: double.infinity,
                              child: const Row(
                                children: [
                                  Expanded(child: TextField()),
                                  Text("회 / 주"),
                                ],
                              ),
                            )
                          : // end of 횟수 세부 설정

                          // start of 요일 세부 설정
                          Container(
                              decoration: BoxDecoration(border: Border.all()),
                              margin: const EdgeInsets.only(top: 10),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DayButton(dayName: "월"),
                                  DayButton(dayName: "화"),
                                  DayButton(dayName: "수"),
                                  DayButton(dayName: "목"),
                                  DayButton(dayName: "금"),
                                  DayButton(dayName: "토"),
                                  DayButton(dayName: "일"),
                                ],
                              ),
                            ), // end of 요일 세부 설정
                    ],
                  ),
                ), // end of 반복 세부 설정

                // start of OK button
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: TextButton(
                    onPressed: () {
                      Todo newTodo = Todo(
                        name: _todoName,
                        startDay: _todoFirstDay,
                        lastDay: _todoLastDay,
                      );

                      context
                          .read<CategoryProvider>()
                          .addTodoInCategory(_todoCategory!, newTodo);

                      // context.read<TodoProvider>().updateEventsList(newTodo);

                      // context.read<EventProvider>().addEvent(newTodo);

                      // TodoTemp newTodo = TodoTemp(
                      //   name: _todoName,
                      //   firstDay: _todoFirstDay,
                      // );

                      // // myTodo.firstDay가 이미 eventsList 키로 존재하는지 확인합니다.
                      // if (!eventsList.containsKey(_todoFirstDay)) {
                      //   // 키가 존재하지 않는 경우, 새로운 리스트를 만들어 Todo 객체를 추가합니다.
                      //   eventsList[_todoFirstDay] = [newTodo];
                      // } else {
                      //   // 키가 이미 존재하는 경우, 해당 리스트에 Todo 객체를 추가합니다.
                      //   eventsList[_todoFirstDay]!.add(newTodo);
                      // }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
                    },
                    child: const Text("확인"),
                  ),
                ), // end of OK button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
