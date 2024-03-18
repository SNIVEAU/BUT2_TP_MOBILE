import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mytheme.dart' as myTheme;
import 'dart:convert';
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: myTheme.MyTheme.light(), // Apply the dark theme from MyTheme
      child: Scaffold(
        appBar: AppBar(
          title: Text('MyWidget'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello World!',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                'Some other text',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              // Add more Text widgets with different styles as needed
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
class Task{
  // final int id;
  // final String title;
  // final String description;
  // final int difficulty;
  // final int nbhours;
  // final List<String> tags;
}
class MyAPI{
  final rootBundle = null;
  Future<List<Task>> getTasks() async{
  await Future.delayed(Duration(seconds: 1));
  final dataString = await _loadAsset('assets/json/tasks.json');
  final Map<String,dynamic> json = jsonDecode(dataString);
  if (json['tasks']!=null){
    final tasks = <Task>[];
    json['tasks'].forEach((element){
    tasks.add(element);
   });
    return tasks;
  }else{
    return [];
  }
  }
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}