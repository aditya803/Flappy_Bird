import 'package:flutter/material.dart';


  class MyBarrier extends StatelessWidget {
    final barrierWidth;
    final barrierHeight;
    final barrierX;
    final bool isthisBottomBarrier;

    MyBarrier({
      this.barrierHeight,
      this.barrierWidth,
      this.barrierX,
      required this.isthisBottomBarrier,
    });
  
    @override
    Widget build(BuildContext context) {
      return Container(
        alignment: Alignment((2* barrierX + barrierWidth) / (2-barrierWidth),
          isthisBottomBarrier ? 1 : -1),
        child: Container(
          color: Colors.green,
          width: MediaQuery.of(context).size.width * barrierWidth/2,
          height: MediaQuery.of(context).size.height * barrierHeight /2,
        ),

      );
    }
  }
  
