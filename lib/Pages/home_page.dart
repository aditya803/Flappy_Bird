import 'dart:async';
import 'package:flappy_bird/model/barrier_model.dart';
import 'package:flutter/material.dart';
import '../model/bird_model.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdY = 0;
  double height = 0;
  double initialPos = birdY;
  double time = 0;
  double birdHeight = 0.1;
  double birdWidth = 0.1;
  int score = 0;
  int highscore = 0;

  bool gameHasStarted = false;

  void _counter(double x){
    setState(() {
      if(x >= birdWidth &&
          x + barrierWidth >= -birdWidth )
        score++;
      if(score>highscore)
        highscore = score;
    });
  }
  static List<double> barrierX=  [2 , 2 + 1.5];
  static double barrierWidth = 0.5;
  List<List<double>> barrierHeight = [
    [0.6,0.4],
    [0.4,0.6]
  ];
  void jump(){
    setState(() {
      time =0;
      initialPos = birdY;
    });
  }
  void startGame(){
    gameHasStarted=true;
    Timer.periodic(Duration(milliseconds: 50), (timer){
      time+=0.01;

      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdY = initialPos - height;
      });

      if(birdisDead()){
        timer.cancel();
        gameHasStarted=false;
        _showDialog();
      }

      moveMap();
    });
  }
  void moveMap(){
    for(int i=0;i< barrierX.length;i++){
      setState(() {
        barrierX[i] -= 0.05;
      });

      if(barrierX[i] <-1.5){
         barrierX[i] += 3;
      }
    }
  }
  bool birdisDead(){
    if(birdY < -1 || birdY > 1){
      score = 0;
      return true;
    }
    int i, x=0;
    for(i=0;i< barrierX.length;i++){
      if(barrierX[i] <= birdWidth &&
         barrierX[i] + barrierWidth >= -birdWidth &&
         (birdY <= -1 + barrierHeight[i][0] ||
           birdY + birdHeight >= 1 - barrierHeight[i][1])){
        score=0;
        return true;
      }else{
        x=i;
      }
    }
    _counter(barrierX[x]);
    return false;
  }
  void _showDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: Colors.brown,
          title: Center(
            child: Text(
                'G A M E O V E R',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: resetGame,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  padding: EdgeInsets.all(7),
                  color: Colors.white,
                  child: Text(
                      'PLAY AGAIN',
                    style: TextStyle(
                      color: Colors.brown
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      }

    );
  }
  void resetGame(){
    Navigator.pop(context);
    setState(() {
      birdY=0;
      gameHasStarted=false;
      time=0;
      initialPos=birdY;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameHasStarted ? jump : startGame,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue,
                child: Stack(
                  children: [
                    MyBird(
                      birdY: birdY,
                      birdHeight: birdHeight,
                      birdWidth: birdWidth,
                    ),
                    Container(
                      alignment: Alignment(0,-0.3),
                      child: Text(
                        gameHasStarted ? ' '
                        : 'T A P  T O  P L A Y',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    MyBarrier(
                      barrierX: barrierX[0],
                      barrierHeight: barrierHeight[0][1],
                      barrierWidth: barrierWidth,
                      isthisBottomBarrier: false
                    ),
                    MyBarrier(
                        barrierX: barrierX[0],
                        barrierHeight: barrierHeight[0][1],
                        barrierWidth: barrierWidth,
                        isthisBottomBarrier: true
                    ),
                    MyBarrier(
                        barrierX: barrierX[1],
                        barrierHeight: barrierHeight[1][0],
                        barrierWidth: barrierWidth,
                        isthisBottomBarrier: false
                    ),
                    MyBarrier(
                        barrierX: barrierX[1],
                        barrierHeight: barrierHeight[1][1],
                        barrierWidth: barrierWidth,
                        isthisBottomBarrier: true
                    ),
                  ],
                ),
              ),
            ),
            Container(color: Colors.green,height: 15),
            Expanded(
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('SCORE',style: TextStyle(color: Colors.white,fontSize: 15),),
                        SizedBox(height: 20),
                        Text('$score',style: TextStyle(color: Colors.white,fontSize: 15),)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('HIGH SCORE',style: TextStyle(color: Colors.white,fontSize: 15),),
                        SizedBox(height: 20),
                        Text('$highscore',style: TextStyle(color: Colors.white,fontSize: 15),)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
