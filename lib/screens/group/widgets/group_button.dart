import 'package:dotple/constants/constants.dart';
import 'package:dotple/constants/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GroupButtonCircular extends StatelessWidget {
  VoidCallback callback;
  String text;
  bool dark = false;

  GroupButtonCircular({
    super.key,
    required this.callback,
    required this.text,
    required this.dark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      // padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      // margin: EdgeInsets.only(bottom: screenHeight * 0.05),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
              color: dark == false ? const Color(0xffA6A6A6) : Colors.black),
          borderRadius: BorderRadius.circular(50),
          color: dark == false ? Colors.white : Colors.black,
        ),
        child: TextButton(
          onPressed: callback,
          child: Text(
            text,
            style: dark == false
                ? DotPleTextStyle.circularButtonTextWhite
                : DotPleTextStyle.circularButtonTextBlack,
          ),
        ),
      ),
    );
  }
}

class GroupButtonSquare extends StatelessWidget {
  VoidCallback callback;
  String text;
  Widget leadingWidget;

  GroupButtonSquare({
    super.key,
    required this.callback,
    required this.text,
    required this.leadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: leadingWidget,
        title: Text(
          text,
          style: DotPleTextStyle.sqaureButtonTextWhite,
        ),
        onTap: callback,
      ),
    );
  }
}
