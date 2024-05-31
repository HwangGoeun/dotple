import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dotple/constants/constants.dart';
import 'package:dotple/model/group_model.dart';
import 'package:dotple/provider/group_provider.dart';
import 'package:dotple/screens/group/screens/group_in/group_main.dart';
import 'package:dotple/screens/group/screens/group_list/group_screen.dart';
import 'package:dotple/screens/group/widgets/group_button.dart';
import 'package:dotple/screens/group/widgets/group_input.dart';
import 'package:dotple/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:dotple/constants/config.dart';

class GroupMaking extends StatefulWidget {
  const GroupMaking({super.key});

  @override
  State<GroupMaking> createState() => _GroupMakingState();
}

class _GroupMakingState extends State<GroupMaking> {
  final _formKey = GlobalKey<FormState>();
  late String _groupName, _groupInfo;
  late Group _newGroup;

  final bool _dark = false;

  TextEditingController groupNameController = TextEditingController();
  TextEditingController groupInfoController = TextEditingController();
  bool _isNotValidate = false;

  void createGroup() async {
    if (groupNameController.text.isNotEmpty &&
        groupInfoController.text.isNotEmpty) {
      var regBody = {
        "groupName": groupNameController.text,
        "groupInfo": groupInfoController.text,
      };

      var response = await http.post(
        Uri.parse("http://localhost:3000/createGroup"),
        headers: {"Content-Type": "application/jon"},
        body: jsonEncode(regBody),
      );

      print(response);
      _newGroup = Group(name: _groupName, information: _groupInfo);
      context.read<GroupProvider>().addGroup(_groupName, _groupInfo);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GroupMain(
            group: _newGroup,
          ),
        ),
      );
      if (response.statusCode == 200) {
        print("Response: ${response.body}");
        _newGroup = Group(name: _groupName, information: _groupInfo);
        context.read<GroupProvider>().addGroup(_groupName, _groupInfo);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GroupMain(
              group: _newGroup,
            ),
          ),
        );
      } else {
        print("Failed to create group. Status code: ${response.statusCode}");
        print("Response: ${response.body}");
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    void buttonAction() {
      if (_formKey.currentState!.validate()) {
        if (_formKey.currentState!.validate() == true) {}
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("그룹 생성하기"),
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        padding: EdgeInsets.only(top: screenHeight * 0.03),
        child: Form(
          // key: _formKey,
          child: Column(
            children: [
              // start of group name
              Container(
                height: screenHeight * 0.1,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 234, 231, 231),
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: groupNameController,
                  decoration: InputDecoration(
                    hintText: "그룹 이름을 입력하세요",
                    isDense: true,
                    // border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    border: InputBorder.none,
                    // InputDecoration(
                    //     contentPadding: EdgeInsets.only(
                    //   bottom: 10,
                    // ))),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "값을 입력해주세요.";
                    } else {}
                    return null;
                  },
                  maxLines: 1,
                  onChanged: (value) {
                    _groupName = value;
                  },
                ),
              ),
              // GroupInput(
              //   title: "그룹 이름",
              //   boxHegith: screenHeight * 0.175,
              //   textfieldHeight: 1,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return "값을 입력해주세요.";
              //     } else {}
              //     return null;
              //   },
              //   onchanged: (value) {
              //     _groupName = value!;
              //   },
              // ),
              // end of group name

              // start of group introduce
              Container(
                height: screenHeight * 0.25,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 234, 231, 231),
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: groupInfoController,
                  decoration: InputDecoration(
                    hintText: "그룹 설명을 입력하세요",
                    isDense: true,
                    // border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    border: InputBorder.none,
                    // InputDecoration(
                    //     contentPadding: EdgeInsets.only(
                    //   bottom: 10,
                    // ))),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "값을 입력해주세요.";
                    } else {}
                    return null;
                  },
                  maxLines: 5,
                  onChanged: (value) {
                    _groupInfo = value;
                  },
                ),
              ),
              // Container(
              //   padding: EdgeInsets.only(top: screenHeight * 0.03),
              //   child: GroupInput(
              //     title: "그룹 설명",
              //     // formKey: _formKey,
              //     boxHegith: screenHeight * 0.3,
              //     textfieldHeight: 5,

              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return "값을 입력해주세요.";
              //       } else {}
              //       return null;
              //     },
              //     onchanged: (value) {
              //       _groupInfo = value!;
              //     },
              //   ),
              // ),
              // end of group introduce

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: GroupButtonCircular(
                    callback: createGroup,
                    text: "그룹 생성하기",
                    dark: _dark,
                  ),
                ),
              ),
              // Expanded(
              //   child: Container(
              //     alignment: Alignment.bottomCenter,
              //     padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              //     margin: EdgeInsets.only(bottom: screenHeight * 0.05),
              //     child: Container(
              //       width: double.infinity,
              //       decoration: BoxDecoration(
              //         border: Border.all(),
              //         borderRadius: BorderRadius.circular(50),
              //       ),
              //       child: TextButton(
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => const GroupScreen(),
              //             ),
              //           );
              //         },
              //         child: const Text("그룹 생성하기"),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      )),
    );
  }
}
