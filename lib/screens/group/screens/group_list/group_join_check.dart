// ignore_for_file: sized_box_for_whitespace

import 'package:dotple/constants/constants.dart';
import 'package:dotple/screens/group/screens/group_list/group_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GroupJoinCheck extends StatelessWidget {
  const GroupJoinCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("그룹 가입"),
      ),
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(border: Border.all()),
        width: screenWidth,
        height: screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: screenHeight * 0.1),
              width: screenWidth * 0.9,
              height: screenHeight * 0.4,
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("참여 신청이 완료되었습니다.")],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: screenHeight * 0.05,
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
              ),
              decoration: BoxDecoration(border: Border.all()),
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GroupScreen(),
                    ),
                  );
                },
                child: const Text("돌아가기"),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
