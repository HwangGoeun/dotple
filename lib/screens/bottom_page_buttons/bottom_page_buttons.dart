import 'package:dotple/constants/constants.dart';
import 'package:dotple/constants/variable.dart';
import 'package:dotple/screens/group/screens/group_list/group_screen.dart';
import 'package:dotple/screens/home/home.dart';
import 'package:dotple/screens/mypage/mypage_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomPageButtons extends StatelessWidget {
  const BottomPageButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // color: Colors.amber,
          ),
      width: screenWidth,
      height: screenHeight * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // start of home button
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const Home(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return child;
                      },
                      transitionDuration: const Duration(
                          seconds: 0), // 애니메이션 지속 시간을 0으로 설정하여 애니메이션을 없앰
                    ),
                    (route) => false,
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                    ImgPath.naviHomeButton,
                  ))),
                ),
                // Image.asset(ImgPath.naviHomeButton),
              ),
            ),
          ),
          // end of home button
          // start of group button
          Expanded(
            child: SizedBox(
              height: double.infinity,
              // decoration: const BoxDecoration(color: Colors.blue),
              child: TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const GroupScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return child;
                      },
                      transitionDuration: const Duration(
                          seconds: 0), // 애니메이션 지속 시간을 0으로 설정하여 애니메이션을 없앰
                    ),
                    (route) => false,
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        ImgPath.naviGroupButton,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // end of group button
          // start of mypage button
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                  // color: Colors.red,
                  ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const MyPageScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return child;
                      },
                      transitionDuration: const Duration(
                          seconds: 0), // 애니메이션 지속 시간을 0으로 설정하여 애니메이션을 없앰
                    ),
                    (route) => false,
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        ImgPath.naviMyButton,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // end of mypage button
        ],
      ),
    );
  }
}
