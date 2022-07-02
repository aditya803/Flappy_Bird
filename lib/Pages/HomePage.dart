import 'dart:async';
import 'dart:ui';


import 'package:flappy_bird/Pages/bird.dart';
import 'package:flutter/material.dart';

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

      if(birdYaxis>1){
        timer.cancel();
        gameState = false;
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: (){
                      if(gameState){
                        jump();
                      }
                      else{
                        startGame();
                      }
                    },
                    child: AnimatedContainer(
                      alignment: Alignment(0,birdYaxis),
                      color: Colors.blue,
                      duration: Duration(milliseconds: 0),
                      child: Mybird(),
                    ),
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
                  )
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
    );
  }
}
