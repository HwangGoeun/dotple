// import 'package:dotple/constants/variable.dart';
// import 'package:dotple/provider/category_provider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:provider/provider.dart';

// class CalendarList extends StatefulWidget {
//   const CalendarList({super.key});

//   @override
//   State<CalendarList> createState() => _CalendarListState();
// }

// class _CalendarListState extends State<CalendarList> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {

//     List<Category> _categoryList = context.watch<CategoryProvider>().categoryList;
//     return ListView(
//       shrinkWrap: true,
//       physics: const ScrollPhysics(),
//       children: categoryList
//           .map((e) => Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Container(
//                       width: screenWidth * 0.95,
//                       decoration: const BoxDecoration(
//                         color: Color.fromARGB(255, 196, 196, 196),
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(9),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                           left: 15.0,
//                           top: 8,
//                           bottom: 8,
//                         ),
//                         child: Text(
//                           e.name,
//                           style: TextStyle(
//                             fontSize: screenWidth / 20,
//                           ),
//                         ),
//                       ),
//                     ),
//                     // ListView(
//                     //   shrinkWrap: true,
//                     //   children: getEventForDay(_selectedDay!)
//                     //       .map((e) => ListTile(
//                     //             title: Text(e.toString()),
//                     //           ))
//                     //       .toList(),
//                     // )
//                   ],
//                 ),
//               ))
//           .toList(),
//     );
//   }
// }

// import 'package:dotple/constants/constants.dart';
// import 'package:flutter/cupertino.dart';

// class CalendarList extends StatefulWidget {
//   const CalendarList({super.key});

//   @override
//   State<CalendarList> createState() => _CalendarListState();
// }

// class _CalendarListState extends State<CalendarList> {
//   @override
//   Widget build(BuildContext context) {
//     return // start of todo list
//         Container(
//       height: screenHeight * 0.37,
//       // decoration: const BoxDecoration(color: Colors.amber),
//       padding: EdgeInsets.only(top: screenHeight * 0.01),

//       // start of showing category block
//       child: ListView(
//         shrinkWrap: true,
//         physics: const ScrollPhysics(),
//         children: _categoryList
//             .map((categoryItem) => Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Container(
//                         width: screenWidth * 0.95,
//                         decoration: const BoxDecoration(
//                           color: Color.fromARGB(255, 196, 196, 196),
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(9),
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                             left: 15.0,
//                             top: 8,
//                             bottom: 8,
//                           ),
//                           child: Text(
//                             categoryItem.name,
//                             style: TextStyle(
//                               fontSize: screenWidth / 20,
//                             ),
//                           ),
//                         ),
//                       ),

//                       // start of showing todo list tiles
//                       SizedBox(
//                         child: ListView.builder(
//                           shrinkWrap: true,
//                           itemCount: categoryItem.todoList.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return ListTile(
//                               onTap: () {
//                                 context
//                                     .read<TodoProvider>()
//                                     .changeDone(categoryItem.todoList[index]);
//                                 setState(() {});
//                               },
//                               leading: Icon(
//                                 Icons.circle,
//                                 color: categoryItem.todoList[index].done
//                                     ? categoryItem.color
//                                     : categoryItem.color!.withOpacity(0.5),
//                               ),
//                               title: Text(
//                                 categoryItem.todoList[index].name,
//                                 style: TextStyle(
//                                   color: categoryItem.todoList[index].done
//                                       ? Colors.black
//                                       : Colors.grey,
//                                 ),
//                               ),

//                               // start of hamburger menu
//                               trailing: PopupMenuButton<MenuType>(
//                                 initialValue: selectedMenu,
//                                 onSelected: (MenuType select) {
//                                   setState(() {
//                                     selectedMenu = select;
//                                     // if (selectedMenu == MenuType.delete) {

//                                     // }
//                                   });
//                                 },
//                                 itemBuilder: (BuildContext context) {
//                                   return <PopupMenuEntry<MenuType>>[
//                                     PopupMenuItem(
//                                       value: MenuType.edit,
//                                       child: const Text("수정하기"),
//                                       onTap: () {},
//                                     ),
//                                     PopupMenuItem(
//                                       value: MenuType.delete,
//                                       child: const Text("삭제하기"),
//                                       onTap: () {
//                                         showDialog(
//                                           context: context,
//                                           barrierDismissible: false,
//                                           builder: (context) {
//                                             return AlertDialog(
//                                               content: const Text(
//                                                 "할 일을 삭제하겠습니다? 삭제된 후에는 복구할 수 없습니다.",
//                                               ),
//                                               actions: [
//                                                 TextButton(
//                                                   onPressed: () {
//                                                     Navigator.pop(context);
//                                                   },
//                                                   child: const Text("취소"),
//                                                 ),
//                                                 TextButton(
//                                                   onPressed: () {
//                                                     Navigator.pop(context);
//                                                     context
//                                                         .read<
//                                                             CategoryProvider>()
//                                                         .deleteTodoInCategory(
//                                                             categoryItem,
//                                                             categoryItem
//                                                                     .todoList[
//                                                                 index]);
//                                                   },
//                                                   child: const Text("삭제"),
//                                                 ),
//                                               ],
//                                             );
//                                           },
//                                         );
//                                       },
//                                     ),
//                                   ];
//                                 },
//                               ),
//                               // end of hamburger menu
//                             );
//                           },
//                         ),
//                       ),
//                       // end of showing todo list tiles

//                       // start of add Todo button
//                       ListTile(
//                         key: const Key('add_button'),
//                         title: const Text('추가하기'),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const TodoScreen(),
//                             ),
//                           );
//                         },
//                       ),
//                       // end of add Todo button

//                       // ListView(
//                       //   shrinkWrap: true,
//                       //   children: getEventForDay(_selectedDay!)
//                       //       .map((e) => Container(
//                       //             child: ListView(
//                       //               children: [
//                       //                 ListTile(
//                       //                   title: Text(e.toString()),
//                       //                 ),
//                       //                 Container(
//                       //                   width: screenHeight * 0.2,
//                       //                   height: screenHeight * 0.1,
//                       //                   decoration: const BoxDecoration(
//                       //                       color: Colors.amber),
//                       //                 )
//                       //               ],
//                       //             ),
//                       //           ))
//                       //       .toList(),
//                       // )
//                     ],
//                   ),
//                 ))
//             .toList(),
//       ), // end of showing category block
//     ); // end of todo list;
//   }
// }
