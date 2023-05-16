import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(BasketballGame());
}

class BasketballGame extends StatefulWidget {
  @override
  _BasketballGameState createState() => _BasketballGameState();
}

class _BasketballGameState extends State<BasketballGame> {
  int score = 0;

  void shootBall() {
    setState(() {
      // Generate a random number between 1 and 10 as the shooting result
      Random random = Random();
      int shootingResult = random.nextInt(10) + 1;

      // If the shooting result is greater than 5, increment the score
      if (shootingResult > 5) {
        score++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basketball Game'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Score: $score',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: shootBall,
                child: Text('Shoot'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
