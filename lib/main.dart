// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: Scaffold(body: Center(child: Text('Amou'))));
//   }
// }

import 'package:flutter/material.dart';
import 'views/screens/etudiants_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liste Étudiants',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: EtudiantsListScreen(),
    );
  }
}
