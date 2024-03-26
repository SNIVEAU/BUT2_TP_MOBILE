import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nombre Mystère',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0), 
            Text(
              'Règles du jeu : Nombre mystère',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              '1. Objectif du jeu : Deviner un nombre mystère choisi aléatoirement par l\'ordinateur.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '2. Plage de nombres : Le nombre mystère est choisi dans une plage définie.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '3. Déroulement du jeu : Les joueurs proposent des nombres jusqu\'à ce que le nombre mystère soit trouvé.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '4. Fin du jeu : Le jeu se termine lorsque le nombre mystère est trouvé.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
