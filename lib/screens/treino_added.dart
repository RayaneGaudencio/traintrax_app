import 'package:flutter/material.dart';
import 'package:flutter_traintrax/data/http/treino_service.dart';
import 'package:flutter_traintrax/data/models/treino_com_exercicios.dart';
import 'package:flutter_traintrax/screens/ScreenArgument.dart';

class TreinoAdded extends StatelessWidget {
  const TreinoAdded({super.key});
  static const routeName = '/treinoAdded';


  @override
  Widget build(BuildContext context) {
  final args = ModalRoute.of(context)!.settings.arguments as ScreenArgument;

 return Scaffold(
      appBar: AppBar(
        title: const Text(
        "Treino",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Color(0xFF7600F5),
      ),
      body: FutureBuilder<List<TreinoComExerciciosModel>>(
        future: TreinoService.getTreinoAndExercicios(args.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum dado encontrado'));
          } else {
            final treino = snapshot.data![0]; 
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    treino.nome,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(treino.diaSemana,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: treino.exercicios.length,
                    itemBuilder: (context, index) {
                      final exercicio = treino.exercicios[index];
                      return ListTile(
                        title: Text(exercicio.nome),
                        subtitle: Text('${exercicio.series} séries - ${exercicio.repeticoes} repetições'),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}