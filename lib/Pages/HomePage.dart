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
  double time =0;
  double height =0;
  double initialHeight=0;

  void jump(){
    initialHeight = birdYaxis;
    Timer.periodic(Duration(milliseconds: 100), (timer){
      time += 0.1;
      height = -4.9 * time * time + 2.9 * time;
      setState(() {
        birdYaxis = initialHeight - height;
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
