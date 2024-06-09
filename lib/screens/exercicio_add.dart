import 'package:flutter/material.dart';
import 'package:flutter_traintrax/components/decoration_input.dart';

class ExercicioAdd extends StatelessWidget {
  const ExercicioAdd({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Exercício",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF7600F5),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration:getInput("Nome do Exercicio")
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration:getInput("Séries")
              ),
              TextFormField(
                decoration:getInput("Repetições")
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/exercicioAdd',
                    arguments: {},
                  );
                },
                  style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF7600F5)), 
                ),
                child: const Text(
                  'Adicionar Exercício',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18 
                ),
                )
              ),
             SizedBox(height: 16),
            ]
          ),
        ),
      ),
    );
  }
}