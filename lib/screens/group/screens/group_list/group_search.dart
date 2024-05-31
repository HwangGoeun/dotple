// ignore_for_file: sized_box_for_whitespace, no_leading_underscores_for_local_identifiers

import 'package:dotple/constants/constants.dart';
import 'package:dotple/model/group_model.dart';
import 'package:dotple/provider/group_provider.dart';
import 'package:dotple/screens/group/screens/group_list/group_join.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class GroupSearch extends StatefulWidget {
  const GroupSearch({super.key});

  @override
  State<GroupSearch> createState() => _GroupSearchState();
}

class _GroupSearchState extends State<GroupSearch> {
  @override
  Widget build(BuildContext context) {
    List<Group> _groupList = context.watch<GroupProvider>().groupList;

    return Scaffold(
      appBar: AppBar(
        title: const Text("그룹 검색"),
      ),
      body: SafeArea(
          child: Container(
        height: screenHeight,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          children: [
            // start of searching
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "그룹 이름을 입력하세요",
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
            ), // end of searching

            Expanded(
                child: ListView.builder(
                    itemCount: _groupList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_groupList[index].name),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GroupJoin(
                                group: _groupList[index],
                              ),
                            ),
                          );
                        },
                      );
                    })),
          ],
        ),
      )),
    );
  }
}
