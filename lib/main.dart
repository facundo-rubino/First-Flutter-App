import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

//no me deja poner la barra baja ("_") en "MyAppState"
class MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Cual es el máximo anotador de todos los tiempos?',
      'answers': [
        'Kareem Abdul Jabbar',
        'Michael Jordan',
        'LeBron James',
        'Kobe Bryant',
      ],
    },
    {
      'questionText': 'Cuál de estos jugadores es más alto?',
      'answers': [
        'Yao Ming',
        'Boban Marjanovic',
        'Manute Bol',
        'Ralph Sampson',
      ],
    },
    {
      'questionText': 'Cuál de estos equipos tiene más campeonatos?',
      'answers': [
        'Miami Heat',
        'Houston Rockets',
        'Milwaukee Bucks',
        'Tienen los mismos campeonatos',
      ],
    },
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('Tenemos más preguntas');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('NBA quiz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(),
      ),
    );
  }
}
