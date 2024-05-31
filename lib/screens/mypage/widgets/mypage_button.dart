import 'package:flutter/material.dart';

class MyPageButton extends StatelessWidget {
  late String title;

  MyPageButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all()),
          child: Text(title),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
