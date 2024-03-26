import 'package:flutter/material.dart';
import './GameResult.dart';

class SecondPage extends StatelessWidget {
  SecondPage(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Résultats:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            if (_allResults.isNotEmpty) ...[
              
              for (var result in _allResults) ...[
              
                Text(
                  'Nom: ${result.name}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Nombre de tentatives: ${result.attempts}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Niveau: ${result.level}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
              ],
            ] else ...[
              
              Text(
                'Aucun résultat disponible',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ],
        ),
      ),
    );
  }
}


List<GameResult> _allResults = [];


void addResult(GameResult result) {
  _allResults.add(result);
}
