import 'package:dotple/constants/constants.dart';
import 'package:dotple/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NickName extends StatelessWidget {
  const NickName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                // decoration: BoxDecoration(border: Border.all()),
                child: const Text("회원님이 사용하실 닉네임을 입력해주세요."),
              ),
            ),
            Expanded(
              child: Container(
                // decoration: BoxDecoration(border: Border.all()),
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                alignment: Alignment.center,
                child: const TextField(),
              ),
            ),
            Expanded(
              child: Container(
                // decoration: BoxDecoration(border: Border.all()),
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                    );
                  },
                  child: const Text("로그인하러 가기"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
