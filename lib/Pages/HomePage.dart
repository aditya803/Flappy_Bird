import 'dart:async';
import 'dart:ffi';

import 'package:flappy_bird/Pages/bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  double birdYaxis = 0;

  void jump(){
    Timer.periodic(Duration(milliseconds: 500), (timer){
      setState(() {
        birdYaxis -= 0.1;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
              child: GestureDetector(
                onTap: jump,
                child: AnimatedContainer(
                  alignment: Alignment(0,birdYaxis),
                  color: Colors.blue,
                  duration: Duration(milliseconds: 0),
                  child: Mybird(),
                ),
              )
          ),
          Expanded(
              child: Container(
                color: Colors.green,
              )
          ),
        ],
      ),
    );
  }
}
