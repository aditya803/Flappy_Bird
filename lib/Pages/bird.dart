import 'package:flutter/material.dart';

class Mybird extends StatelessWidget {
  const Mybird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: Image.asset(
          'assets/bird1.png',
      ),
    );
  }
}
