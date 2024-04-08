import 'package:dotple/screens/category/category.dart';
import 'package:dotple/screens/home/widgets/calendar_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DOTPLE"),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Home screen container
            Container(
              decoration: const BoxDecoration(
                  // color: Colors.amber.shade900,
                  ),
              // Home screen container components
              child: Column(
                children: [
                  // calendar
                  const Calendar(),
                  // add to-do button
                  TextButton(
                    onPressed: () {},
                    child: const Text("할 일 추가하기"),
                  ), // end of add to-do button
                ],
              ),
            ), // end of Home screen container

            // category add button
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.calendar_today_rounded),
              ),
            ) // end of category add button
          ],
        ),
      ),
    );
  }
}
