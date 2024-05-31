import 'package:dotple/constants/constants.dart';
import 'package:dotple/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpStart extends StatelessWidget {
  const SignUpStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          children: [
            Expanded(
                child: Container(
              // decoration: const BoxDecoration(color: Colors.red),
              child: const Text(""),
            )),
            Expanded(
                child: Container(
                    alignment: Alignment.center,
                    // decoration: const BoxDecoration(color: Colors.amber),
                    child: Text(
                      "Welcom to Dotple!",
                      style: TextStyle(
                          fontFamily: "NanumSquareExtraBold",
                          fontSize: screenWidth * 0.08),
                    ))),
            Expanded(
              child: Container(
                // decoration: const BoxDecoration(color: Colors.blue),
                margin: EdgeInsets.only(bottom: screenHeight * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Sign Up!",
                      style: TextStyle(
                          fontFamily: "NanumSquareExtraBold",
                          fontSize: screenWidth * 0.1),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: screenWidth * 0.15,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.28),
                      margin: EdgeInsets.only(top: screenHeight * 0.015),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ),
                          );
                        },
                        child: const Text("닷플 회원가입하기"),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
