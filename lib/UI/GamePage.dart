import 'package:flutter/material.dart';
import 'dart:math';
import './SecondPage.dart';
import './GameResult.dart';
import './FirstPage.dart';

class GamePage extends StatefulWidget {
  final String name;

  GamePage({required this.name});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late int _targetNumber;
  TextEditingController _textFieldController = TextEditingController();
  String _guess = '';
  String _feedback = '';
  int _attempts = 0;
  int _level = 1;
  int _minNumber = 1;
  int _maxNumber = 100;

  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _generateTargetNumber();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _generateTargetNumber() {
    final random = Random();
    _minNumber = 1;
    _maxNumber = _level * 10;
    _targetNumber = random.nextInt(_maxNumber - _minNumber + 1) + _minNumber;
  }

  void _evaluateGuess() {
    int guess = int.tryParse(_guess) ?? 0;

    if (guess < _minNumber || guess > _maxNumber) {
      _textFieldController.clear();
      return;
    }

    _attempts++;
    if (_attempts >= 10) {
      _showGameOverDialog();
      return;
    }

    if (guess > _targetNumber) {
      setState(() {
        _feedback = 'Trop haut';
      });
    } else if (guess < _targetNumber) {
      setState(() {
        _feedback = 'Trop bas';
      });
    } else {
      GameResult result =
          GameResult(name: widget.name, attempts: _attempts, level: _level);
      addResult(result);
      _level++;
      _attempts = 0;
      _generateTargetNumber();
      _showNextLevelDialog();
    }
    _textFieldController.clear();

    // Demande le focus sur le TextField
    _focusNode.requestFocus();
  }

  void _showNextLevelDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Félicitations!'),
          content: Text('Passer au niveau suivant?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _feedback = '';
                });
              },
              child: Text('Oui'),
            ),
          ],
        );
      },
    );
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Text('Vous avez dépassé 10 tentatives'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => FirstPage()));
              },
              child: Text('Rejouer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.name}, Essaie de trouver le nombre entre $_minNumber et $_maxNumber!',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _textFieldController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _guess = value;
                });
              },
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: 'Entrée votre choix ici',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) {
                _evaluateGuess();
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _evaluateGuess();
              },
              child: Text('Envoyer'),
            ),
            SizedBox(height: 20),
            Text(
              'Nombre de tentatives: $_attempts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              _feedback,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
