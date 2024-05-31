// ignore_for_file: no_leading_underscores_for_local_identifiers, sized_box_for_whitespace

import 'package:dotple/constants/constants.dart';
import 'package:dotple/model/group_model.dart';
import 'package:dotple/provider/group_provider.dart';
import 'package:dotple/screens/bottom_page_buttons/bottom_page_buttons.dart';
import 'package:dotple/screens/group/screens/group_in/group_main.dart';
import 'package:dotple/screens/group/screens/group_list/group_making.dart';
import 'package:dotple/screens/group/screens/group_list/group_search.dart';
import 'package:dotple/screens/group/widgets/group_button.dart';
import 'package:dotple/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    List<Group> _groupList = context.watch<GroupProvider>().groupList;

    return Scaffold(
        appBar: AppBar(
          title: const Text("내 소속 그룹"),
        ),
        body: SafeArea(
            child: Stack(
          children: [
            Container(
              height: screenHeight,
              // decoration: const BoxDecoration(color: Colors.amber),
              child: Column(
                children: [
                  Expanded(
                    // flex: 1,
                    child: Container(
                      // decoration: const BoxDecoration(color: Colors.yellow),
                      child: ListView(
                        children: [
                          Container(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _groupList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text(_groupList[index].name),
                                  onTap: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            GroupMain(
                                          group: _groupList[index],
                                        ),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          return child;
                                        },
                                        transitionDuration: const Duration(
                                            seconds:
                                                0), // 애니메이션 지속 시간을 0으로 설정하여 애니메이션을 없앰
                                      ),
                                      (route) => false,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    width: double.infinity,
                    // height: double.infinity,
                    // decoration: const BoxDecoration(color: Colors.red),
                    // alignment: Alignment.bottomCenter,
                    // padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            bottom: 10,
                          ),
                          child: GroupButtonSquare(
                            callback: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const GroupMaking(),
                                ),
                              );
                            },
                            text: "그룹 생성하기",
                            leadingWidget: const Image(
                                image: AssetImage(ImgPath.groupMaking)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            bottom: 10,
                          ),
                          child: GroupButtonSquare(
                              callback: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const GroupMaking(),
                                  ),
                                );
                              },
                              text: "그룹 검색하기",
                              leadingWidget: const Icon(Icons.search)),
                        ),
                      ],
                    ),
                  ),
                  // Flexible(
                  //   flex: 1,
                  //   child: Container(),
                  // ),
                  const BottomPageButtons()
                ],
              ),
            ),
          ],
        )));
  }
}
