// 월화수목금토일 선택하는 버튼

import 'package:dotple/constants/constants.dart';
import 'package:flutter/material.dart';

class DayButton extends StatefulWidget {
  String dayName;

  DayButton({
    super.key,
    required this.dayName,
  });

  @override
  State<DayButton> createState() => _DayButtonState();
}

class _DayButtonState extends State<DayButton> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: checked
            ? const BoxDecoration(color: Colors.amber)
            : const BoxDecoration(),
        width: screenHeight * 0.06,
        child: TextButton(
          onPressed: () {
            checked = !checked;
            setState(() {});
          },
          child: Text(
            widget.dayName,
          ),
        ),
      ),
    );
  }
}
