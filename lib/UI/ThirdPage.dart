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
        child: Text('Third Page Content'),
      ),
    );
  }
}