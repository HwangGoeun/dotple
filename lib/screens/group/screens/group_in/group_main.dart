import 'package:dotple/constants/constants.dart';
import 'package:dotple/constants/style.dart';
import 'package:dotple/model/group_model.dart';
import 'package:dotple/screens/bottom_page_buttons/bottom_page_buttons.dart';
import 'package:dotple/screens/group/screens/group_in/group_setting.dart';
import 'package:dotple/screens/group/widgets/group_button.dart';
import 'package:dotple/widgets/calendar/calendar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GroupMain extends StatefulWidget {
  Group group;

  GroupMain({
    super.key,
    required this.group,
  });

  @override
  State<GroupMain> createState() => _GroupMainState();
}

class _GroupMainState extends State<GroupMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.group.name),
        actions: [
          Container(
            margin: EdgeInsets.only(right: screenWidth * 0.05),
            width: screenWidth * 0.1,
            height: screenWidth * 0.1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GroupSetting(
                      group: widget.group,
                    ),
                  ),
                );
              },
              color: dotPleTheme.primaryColor,
              icon: const Icon(Icons.settings),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          height: screenHeight,
          child: Column(
            children: [
              const Expanded(
                child: SizedBox(
                  child: Calendar(),
                ),
              ),
              SizedBox(
                // decoration: BoxDecoration(border: Border.all()),
                // alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("7일 안에 시작일을 설정하지 않으면 그룹이 삭제돼요!"),
                    ),
                    GroupButtonCircular(
                      callback: () {},
                      text: "시작일로 설정하기",
                      dark: false,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
