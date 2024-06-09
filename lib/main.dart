import 'package:flutter/material.dart';
import 'package:flutter_traintrax/screens/exercicio_add.dart';
import 'package:flutter_traintrax/screens/exercicio_edit.dart';
import 'package:flutter_traintrax/screens/home.dart';
import 'package:flutter_traintrax/screens/treino_add.dart';
import 'package:flutter_traintrax/screens/treino_added.dart';
import 'package:flutter_traintrax/screens/treino_edit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/treinoAdd': (context) => TreinoAdd(),
        '/exercicioAdd': (context) => const ExercicioAdd(),
        '/exercicioEdit': (context) => const ExercicioEdit(),
        '/treinoEdit': (context) => const TreinoEdit(),
        TreinoAdded.routeName: (context) => const TreinoAdded(),
      },
    );
  }
}
