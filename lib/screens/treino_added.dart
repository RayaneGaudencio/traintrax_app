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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder<List<TreinoComExerciciosModel>>(
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          treino.nome,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.purple[700],),
                          iconSize: 30,
                        onPressed: () {
                          Navigator.pushNamed(context, '/treinoEdit');
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${treino.diaSemana}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  if (treino.exercicios.isEmpty)
                    const Text(
                      'Nenhum exercício adicionado ao treino.',
                      style: TextStyle(fontSize: 16),
                    ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: treino.exercicios.length,
                      itemBuilder: (context, index) {
                        final exercicio = treino.exercicios[index];
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                                title: Text(exercicio.nome),
                                subtitle: Text("${exercicio.series} séries - ${exercicio.repeticoes} repetições"),
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.purple[700],
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/exercicioEdit',
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}