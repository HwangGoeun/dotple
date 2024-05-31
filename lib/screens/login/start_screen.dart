import 'package:dotple/constants/constants.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          height: screenHeight,
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      ImgPath.dotpleCharacterShining,
                    ),
                  ),
                ),
                width: screenWidth * 0.6,
                height: screenWidth * 0.6,
              ),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.03),
                child: Column(
                  children: [
                    Text(
                      "Welcome to",
                      style: TextStyle(
                          fontFamily: "NanumSquareExtraBold",
                          fontSize: screenWidth * 0.1),
                    ),
                    Text(
                      "DotPle!",
                      style: TextStyle(
                          fontFamily: "NanumSquareExtraBold",
                          fontSize: screenWidth * 0.13),
                    ),
                  ],
                ),
              )
              // TextButton(
              //   onPressed: () {},
              //   child: const Text("카카오로 로그인하기"),
              // ),
              // TextButton(
              //   onPressed: () {},
              //   child: const Text("구글로 로그인하기"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
