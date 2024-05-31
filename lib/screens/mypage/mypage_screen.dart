import 'package:dotple/constants/constants.dart';
import 'package:dotple/constants/style.dart';
import 'package:dotple/screens/bottom_page_buttons/bottom_page_buttons.dart';
import 'package:dotple/screens/mypage/widgets/mypage_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "마이페이지",
          style: DotPleTextStyle.appBarText,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              // decoration: const BoxDecoration(color: Colors.amber),
              height: screenHeight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // start of personal information
                    Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: screenHeight * 0.1,
                              height: screenHeight * 0.1,
                              decoration: const BoxDecoration(
                                color: Colors.amber,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("이름"),
                                  Text("이메일 주소"),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ), // end of personal information,
                    const SizedBox(
                      height: 10,
                    ),
                    // start of buttons
                    MyPageButton(title: "FAQ"),
                    MyPageButton(title: "문의하기"),
                    MyPageButton(title: "설정"),
                    MyPageButton(title: "공지사항"),
                    MyPageButton(title: "약관 보기"), // end of buttons
                  ],
                ),
              ),
            ),
            const Positioned(
              bottom: 0,
              child: BottomPageButtons(),
            ),
          ],
        ),
      ),
    );
  }
}
