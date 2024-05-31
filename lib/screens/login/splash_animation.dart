import 'package:dotple/constants/constants.dart';
import 'package:dotple/screens/login/widgets/circle_shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashAnimation extends StatefulWidget {
  const SplashAnimation({super.key});

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      // 화면 높이를 가져옴
      var screenHeight = MediaQuery.of(context).size.height;
      // 컨트롤러 값이 특정 임계값을 넘으면 애니메이션 중지
      if (_controller.value * (screenHeight - 200) >= screenHeight - 200) {
        _controller.stop();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(0.0, _controller.value * (screenHeight - 200)),
            child: Container(
              width: 200.0,
              height: 200.0,
              padding: const EdgeInsets.all(8.0),
              color: const Color(0xFF7F7F7F),
              child: const Center(child: Text('Quarter')),
            ),
          );
        },
      ),
    );
  }
}
