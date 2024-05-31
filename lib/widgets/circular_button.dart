import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  late String text;
  bool dark = false;
  VoidCallback callback;

  CircularButton({
    super.key,
    required this.text,
    required this.dark,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(50),
        color: dark ? Colors.black : Colors.white,
      ),
      child: TextButton(
        onPressed: callback,
        child: Text(text),
      ),
    );
  }
}
