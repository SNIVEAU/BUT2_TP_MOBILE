import 'package:flutter/material.dart';
import 'UI/FirstPage.dart';
import 'UI/SecondPage.dart';
import 'UI/ThirdPage.dart';
void main() {
  runApp(MyApp());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: HomePageContent(),
    );
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FirstPage()),
              );
            },
            child: Text('Démarrer une partie'),
          ),
          SizedBox(height: 16), // Adds space of 16 logical pixels
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            },
            child: Text('Voir mes scores'),
          ),
          SizedBox(height: 16), // Adds space of 16 logical pixels
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThirdPage()),
              );
            },
            child: Text('Consulter les règles du jeu'),
          ),
        ],
      ),
    );
  }
}







class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TD2',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'UI/Task.dart';
// import 'UI/Myapi.dart';

// void main() {
//   runApp(MyApp());
// }

// class HomePage {
//   static Widget content() {
//     List<Task> tasks = Task.generateTask(5); // Adjust the number of tasks as needed

//     return Container(
//       color: Colors.blue,
//       // child: ListView.builder(
//       //   itemCount: tasks.length,
//       //   itemBuilder: (context, index) {
//       //     Task task = tasks[index];
//       //     return ListTile(
//       //       title: Text(task.title),
//       //       subtitle: Column(
//       //         crossAxisAlignment: CrossAxisAlignment.start,
//       //         children: [
//       //           Text('Index: $index'),
//       //           Text('Tags: ${task.tags.join(', ')}'),
//       //         ],
//       //       ),
//       //     );
//       //   },
//       // ),


//       // child: Column(
//       //   children: [
//       //     ElevatedButton(
//       //           onPressed: () {
//       //             // Logique pour le premier bouton
//       //           },
//       //           child: Text('Démarrer une partie'),
//       //         ),
//       //   ]
//       // )
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           MyTextButton(
//             myText: "REGLE",
//             myValue: true,
//             returnValue: _handleValue,
//           ),
//           MyTextButton(
//             myText: "FALSE",
//             myValue: false,
//             returnValue: _handleValue,
//           ),
//           MyTextButton(
//             myText: "TRUE",
//             myValue: true,
//             returnValue: _handleValue,
//           ),
//         ],
//     ));
//   }
// }
// void _handleValue(bool value) {
//     debugPrint(value.toString());
//     // if (value == _questions[_currentQuestion].isCorrect) {
//       debugPrint("good");
//       const mySnackBar = SnackBar(
//         content: Text("GOOD ANSWER!!!", style: TextStyle(fontSize: 20)),
//         duration: Duration(milliseconds: 500),
//         backgroundColor: Colors.lightGreen,
//         width: 180.0, // Width of the SnackBar.
//         padding: EdgeInsets.symmetric(
//           horizontal: 8.0, // Inner padding for SnackBar content.
//         ),
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//         ),
//       );
//       // debugPrint("bad");
//       // const mySnackBar = SnackBar(
//       //   content: Text(
//       //     "BAD ANSWER!!!",
//       //     style: TextStyle(fontSize: 20),
//       //   ),
//       //   duration: Duration(milliseconds: 500),
//       //   backgroundColor: Colors.red,
//       //   width: 180.0, // Width of the SnackBar.
//       //   padding: EdgeInsets.symmetric(
//       //     horizontal: 8.0, // Inner padding for SnackBar content.
//       //   ),
//       //   behavior: SnackBarBehavior.floating,
//       //   shape: RoundedRectangleBorder(
//       //     borderRadius: BorderRadius.all(Radius.circular(20)),
//       //   ),
//       // );
//     }

// class SearchPage {
//   static Widget content() {
//     MyAPI api = new MyAPI();
//     Future<List<Task>> listtask = api.getTasks();
//     return Container(
//       color: Colors.green, // Couleur de fond pour la page Recherche
//       child: Center(
//         child: Text('Page 2', style: TextStyle(color: Colors.white, fontSize: 20.0),
//         ),
        
//       ),
//     );
//   }
// }

// class ProfilePage {
//   static Widget content() {
//     return Container(
//       color: Colors.orange, // Couleur de fond pour la page Profil
//       child: Center(
//         child: Text('Page 3', style: TextStyle(color: Colors.white, fontSize: 20.0)),
//       ),
//     );
//   }
// }



// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget selectedPage;
//     switch (_selectedIndex) {
//       case 0:
//         selectedPage = HomePage.content();
//         break;
//       case 1:
//         selectedPage = SearchPage.content();
//         break;
//       case 2:
//         selectedPage = ProfilePage.content();
//         break;
//       default:
//         selectedPage = Container();
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('AppBar'),
//         backgroundColor: Colors.black, // Couleur de fond pour l'AppBar
//       ),
//       body: selectedPage,
//       backgroundColor: Colors.black, // Couleur de fond pour le Scaffold
//       bottomNavigationBar: BottomNavigationBar(
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Accueil',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Recherche',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profil',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.white,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
