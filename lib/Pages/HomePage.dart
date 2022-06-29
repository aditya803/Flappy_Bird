import 'package:flappy_bird/Pages/bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
              child: AnimatedContainer(
                alignment: Alignment(-1,1),
                color: Colors.blue,
                duration: Duration(milliseconds: 0),
                child: Mybird(),
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
