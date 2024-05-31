// ignore_for_file: sized_box_for_whitespace

import 'package:dotple/constants/constants.dart';
import 'package:dotple/model/group_model.dart';
import 'package:dotple/screens/group/screens/group_list/group_join_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GroupJoin extends StatelessWidget {
  final Group group;

  const GroupJoin({
    super.key,
    required this.group,
  });

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(group.name),
                  Text(group.information),
                ],
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
                      builder: (context) => const GroupJoinCheck(),
                    ),
                  );
                },
                child: const Text("참여 신청하기"),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
