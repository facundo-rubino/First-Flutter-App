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
        {'text': 'Kareem Abdul Jabbar', 'score': 0},
        {'text': 'Michael Jordan', 'score': 0},
        {'text': 'LeBron James', 'score': 1},
        {'text': 'Kobe Bryant', 'score': 0},
      ],
    },
    {
      'questionText': 'Cuál de estos jugadores es más alto?',
      'answers': [
        {'text': 'Yao Ming', 'score': 0},
        {'text': 'Boban Marjanovic', 'score': 0},
        {'text': 'Manute Bol', 'score': 1},
        {'text': 'Ralph Sampson', 'score': 0},
      ],
    },
    {
      'questionText': 'Cuál de estos equipos tiene más campeonatos?',
      'answers': [
        {'text': 'Miami Heat', 'score': 1},
        {'text': 'Houston Rockets', 'score': 0},
        {'text': 'Milwaukee Bucks', 'score': 0},
        {'text': 'Tienen los mismos campeonatos', 'score': 0},
      ],
    },
    {
      'questionText': 'Que jugador metió más triples en un partido?',
      'answers': [
        {'text': 'Stephen Curry', 'score': 0},
        {'text': 'Ray Allen', 'score': 0},
        {'text': 'Klay Thompson', 'score': 1},
        {'text': 'Reggie Miller', 'score': 0},
      ],
    },
    {
      'questionText':
          'Quién es el líder en tiros libres anotados en una temporada?',
      'answers': [
        {'text': 'Jerry West', 'score': 1},
        {'text': 'Stephen Curry', 'score': 0},
        {'text': 'Michael Jordan', 'score': 0},
        {'text': 'James Harden', 'score': 0},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

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
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
