//import 'dart:html';

import 'package:flutter/material.dart';

class MyObject extends StatelessWidget {

  final objectHeight;
  final objectWidth;
  final objectPosX;
  final bool isThisBottomBarrier;


  MyObject({
    this.objectHeight,
    this.objectWidth,
    this.objectPosX,
    required this.isThisBottomBarrier,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2* objectPosX + objectWidth) / (2 - objectWidth),
        isThisBottomBarrier ? 1:-1),
      child: Container(
        color: Colors.green,
        width: MediaQuery.of(context).size.width * objectWidth /2,
        height: MediaQuery.of(context).size.height * objectHeight/2,
      ),
    );
  }
}
