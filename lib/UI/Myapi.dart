import 'dart:convert';
import 'Task.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
class MyAPI {
  Future<List<Task>> getTasks() async {
    await Future.delayed(Duration(seconds: 1));
    final dataString = await _loadAsset('json/tasks.json');
    final Map<String, dynamic> jsonData = jsonDecode(dataString);
    final List<dynamic> tasksJson = jsonData['tasks'] ?? [];

    final List<Task> tasks = tasksJson.map((taskJson) {
      return Task(
        id: taskJson['id'],
        title: taskJson['title'],
        tags: List<String>.from(taskJson['tags']),
        nbhours: taskJson['nbhours'],
        difficulty: taskJson['difficulty'],
        description: taskJson['description'],
      );
    }).toList();

    return tasks;
  }

  Future<String> _loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }
}
class MyTextButton extends StatelessWidget{
  String myText;
  bool myValue;
  ValueChanged<bool> returnValue;

  MyTextButton({required this.myText,required this.myValue,required this.returnValue});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => returnValue(myValue),
      child: Text(myText,
          style: const TextStyle(color: Colors.white)),
    );
  }
  
}
