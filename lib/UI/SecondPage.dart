import 'package:flutter/material.dart';
import './GameResult.dart';

class SecondPage extends StatelessWidget {
  SecondPage(); // Constructeur

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
              // Afficher les données des résultats si la liste n'est pas vide
              for (var result in _allResults) ...[
                // Boucler à travers chaque résultat pour les afficher individuellement
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
              // Afficher un message si aucune donnée de résultat n'est disponible
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

// Liste statique des résultats
List<GameResult> _allResults = [];

// Méthode statique pour ajouter un résultat à la liste
void addResult(GameResult result) {
  _allResults.add(result);
}
