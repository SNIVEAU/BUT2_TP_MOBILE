import 'package:flutter/material.dart';
import 'dart:math';
import './SecondPage.dart';
import './GameResult.dart';

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

  @override
  void initState() {
    super.initState();
    _generateTargetNumber();
  }

  void _generateTargetNumber() {
    final random = Random();
    _targetNumber = random.nextInt(100) + 1;
  }

  void _evaluateGuess() {
    int guess = int.tryParse(_guess) ?? 0;
    _attempts++; // Incrémenter le nombre de tentatives à chaque devinette
    if (guess > _targetNumber) {
      setState(() {
        _feedback = 'Trop haut';
      });
    } else if (guess < _targetNumber) {
      setState(() {
        _feedback = 'Trop bas';
      });
    } else {
      // Créer un objet GameResult avec les données pertinentes
      GameResult result = GameResult(name: widget.name, attempts: _attempts);
      // Ajouter le résultat à la liste statique de résultats (appeler la fonction addResult)
      addResult(result);
      // Afficher la boîte de dialogue de confirmation pour recommencer
      _showRestartDialog();
    }
  }

  void _resetGame() {
    _attempts = 0;
    _generateTargetNumber();
    _textFieldController.clear();
  }

  void _showRestartDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Félicitations!'),
          content: Text('Voulez-vous recommencer?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer la boîte de dialogue
                _resetGame(); // Réinitialiser le jeu
              },
              child: Text('Oui'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer la boîte de dialogue
              },
              child: Text('Non'),
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
              'Nombre de tentatives: $_attempts', // Afficher le nombre de tentatives
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

  @override
  void dispose() {
    _textFieldController.dispose(); // Dispose the TextEditingController
    super.dispose();
  }
}
