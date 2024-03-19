import 'package:flutter/material.dart';
import 'dart:math';

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

  @override
  void initState() {
    super.initState();
    _generateTargetNumber();
  }

  void _generateTargetNumber() {
    final random = Random();
    _targetNumber = random.nextInt(100) + 1; // Generates a random number between 1 and 100
  }

  void _evaluateGuess() {
    int guess = int.tryParse(_guess) ?? 0;
    if (guess > _targetNumber) {
      setState(() {
        _feedback = 'Trop haut';
      });
    } else if (guess < _targetNumber) {
      setState(() {
        _feedback = 'Trop bas';
      });
    } else {
      setState(() {
        _feedback = 'Bien joué, ${widget.name}! vous avez trouvé $_targetNumber!';
        _textFieldController.clear(); // Clear the text field
      });
    }
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
              '${widget.name}, Essaie de trouver le nombre de 1 à 100!',
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
              _feedback,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textFieldController.dispose(); // Dispose the TextEditingController
    super.dispose();
  }
}
