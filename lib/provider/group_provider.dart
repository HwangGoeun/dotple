import 'package:dotple/model/group_model.dart';
import 'package:flutter/material.dart';

class GroupProvider with ChangeNotifier {
  final List<Group> _groupList = [
    Group(name: "group1", information: "It is group1"),
    Group(name: "group2", information: "It's group2")
  ];
  List<Group> get groupList => _groupList;

  void addGroup(String groupName, String groupInfo) {
    _groupList.add(Group(name: groupName, information: groupInfo));
    notifyListeners();
  }

  void deleteGroup(String groupName) {
    _groupList.remove(groupName);
    notifyListeners();
  }
}
