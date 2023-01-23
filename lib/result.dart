import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;

    if (resultScore <= 2) {
      resultText = "Hay que estudiar más";
    } else if (resultScore <= 4) {
      resultText = "Muy bien";
    } else {
      resultText = "Excelente";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          TextButton(
            child: Text('Reiniciar Quiz!'),
            style: TextButton.styleFrom(primary: Colors.red),
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
