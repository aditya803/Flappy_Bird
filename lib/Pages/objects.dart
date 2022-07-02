import 'package:flutter/material.dart';

class MyObject extends StatelessWidget {

  final size;
  MyObject({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(
          color: (Colors.green[800])!,
          width: 10
        )
      ),

    );
  }
}
