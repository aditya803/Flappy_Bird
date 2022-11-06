import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  final birdY;
  final double birdHeight;
  final double birdWidth;

  MyBird({
    this.birdY,
    required this.birdHeight,
    required this.birdWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0,(2 * birdY +birdHeight) / (2-birdHeight)),
      child: Image.asset(
          'assets/img_bird.png',
        width: MediaQuery.of(context).size.height * birdWidth / 2,
        height: MediaQuery.of(context).size.height * birdHeight / 2,
        fit: BoxFit.fill,
      ),
    );
  }
}
