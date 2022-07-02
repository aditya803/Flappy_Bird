import 'dart:async';
import 'dart:ui';


import 'package:flappy_bird/Pages/bird.dart';
import 'package:flutter/material.dart';

import 'objects.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  static double birdYaxis = 0;
  double time =0;
  double height =0;
  double initialHeight= birdYaxis;
  bool gameState = false;
  static double pos1 = 0;
  double pos2 = pos1 + 1.5;

  void jump(){
    setState(() {
      initialHeight = birdYaxis;
      time = 0;
    });
  }

  void startGame(){
    gameState = true;
    Timer.periodic(Duration(milliseconds: 60), (timer){
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdYaxis = initialHeight - height;
      });

      setState(() {
        if(pos1 < -2)
          {pos1 +=3.5;}
        else
          {pos1 -= 0.05;}
      });
      setState(() {
        if(pos2 < -2)
          {pos2 +=3.5;}
        else
          {pos2 -= 0.05;}
      });

      if(birdYaxis>1){
        timer.cancel();
        gameState = false;
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(gameState){
          jump();
        }
        else{
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      alignment: Alignment(0,birdYaxis),
                      color: Colors.blue,
                      duration: Duration(milliseconds: 0),
                      child: Mybird(),
                    ),
                    Container(
                      alignment: Alignment(0,-0.2),
                      child: gameState
                          ? Text(" ")
                          : Text("T A P  T O  P L A Y",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20)
                      )
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(pos1,1.1),
                      child: MyObject(
                        size: 200.0,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(pos1,-1.1),
                      child: MyObject(
                        size: 200.0,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(pos2,1.1),
                      child: MyObject(
                        size: 120.0,
                      )
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(pos2,-1.1),
                      child: MyObject(
                        size: 150.0,
                      ),
                    ),
                  ],
                )
            ),
            Container(
              height: 15,
              color: Colors.green,
            ),
            Expanded(
                child: Container(
                  color: Colors.brown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text("SCORE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20 ),),
                          SizedBox(height: 10),
                          Text("0",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20 ))
                        ]
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text("HIGHSCORE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,  fontSize: 20 )),
                          SizedBox(height: 10),
                          Text("0",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,  fontSize: 20 ))
                        ]
                      )
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
