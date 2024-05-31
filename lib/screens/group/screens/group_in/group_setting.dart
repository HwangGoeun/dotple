import 'package:dotple/constants/constants.dart';
import 'package:dotple/model/group_model.dart';
import 'package:dotple/screens/group/widgets/group_button.dart';
import 'package:dotple/screens/group/widgets/group_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GroupSetting extends StatefulWidget {
  final Group group;

  const GroupSetting({
    super.key,
    required this.group,
  });

  @override
  State<GroupSetting> createState() => _GroupSettingState();
}

class _GroupSettingState extends State<GroupSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("그룹 설정"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GroupInputFrame(
                title: "그룹 이름",
                boxHegith: screenHeight * 0.15,
                textfieldHeight: 1,
                hint: widget.group.name,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GroupInputFrame(
                title: "그룹 설명",
                boxHegith: screenHeight * 0.3,
                textfieldHeight: 5,
                hint: widget.group.information,
              ),
            ),

            // start of 정산일
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 234, 231, 231),
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: const Text("정산일"),
                  ),
                  Expanded(
                    child: SizedBox(
                      // width: screenWidth * 0.5,
                      // height: screenHeight * 0.1,
                      child: TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // end of 정산일

            // start of group buttons
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: screenWidth * 0.01),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 234, 231, 231),
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text("멤버 관리하기"),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: screenWidth * 0.01),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 234, 231, 231),
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "그룹 삭제하기",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // end of group buttons

            Expanded(
                child: Container(
              child: GroupButtonCircular(
                  callback: () {
                    Navigator.pop(context);
                  },
                  text: "저장하기",
                  dark: true),
            ))
          ],
        ),
      ),
    );
  }
}
