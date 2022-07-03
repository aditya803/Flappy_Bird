//import 'dart:html';

import 'package:flutter/material.dart';

class Mybird extends StatelessWidget {
  final birdY;
  final double bWidth;
  final double bHeight;

  Mybird({
    this.birdY,
    required this.bHeight,
    required this.bWidth
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, (2*birdY+bHeight)/(2-bHeight)),
      child: Image.asset(
          'assets/bird1.png',
          fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width * bWidth/2,
        height: MediaQuery.of(context).size.height * bHeight/2,
      ));
  }
}
