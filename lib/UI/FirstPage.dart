import 'package:flutter/material.dart';
import 'GamePage.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String _name = '';

  void _navigateToGamePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return GamePage(name: _name);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Entrée votre nom ici:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Container( // Container pour définir la largeur du bouton
              width: 200, // Largeur désirée du bouton
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Entrée votre nom ici',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (_) => _navigateToGamePage(context),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Bienvenue, $_name!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
