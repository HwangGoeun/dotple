import 'dart:ui';

import 'package:dotple/constants/constants.dart';
import 'package:dotple/constants/style.dart';
import 'package:dotple/constants/variable.dart';
import 'package:dotple/provider/category_provider.dart';
import 'package:dotple/screens/bottom_page_buttons/bottom_page_buttons.dart';
import 'package:dotple/screens/category/category.dart';
import 'package:dotple/screens/category/category_add.dart';
import 'package:dotple/screens/todo/todo_screen.dart';
import 'package:dotple/widgets/calendar/calendar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DateTime now = DateTime.now();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DOTPLE",
          style: DotPleTextStyle.appBarText,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CategoryScreen(),
                ),
              );
            },
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          // decoration: const BoxDecoration(color: Colors.red),
          // Home screen container components
          // padding: EdgeInsets.only(top: screenHeight * 0.01),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // start of calendar
              Container(
                // padding: const EdgeInsets.all(3),
                child: const Calendar(),
              ),
              // end of calendar
              // Expanded(child: Container()),
              Container(
                  // decoration: BoxDecoration(
                  //   border: Border.all(),
                  //   color: Colors.amber,
                  // ),
                  child: const BottomPageButtons()),
            ],
          ),
        ),
      ),
    );
  }
}
