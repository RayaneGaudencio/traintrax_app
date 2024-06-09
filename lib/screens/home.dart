import 'package:flutter/material.dart';
import 'package:flutter_traintrax/data/http/http_client.dart';
import 'package:flutter_traintrax/data/models/treino_model.dart';
import 'package:flutter_traintrax/data/repositories/treino_repository.dart';
import 'package:flutter_traintrax/stores/treino_story.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  final TreinoStore store = TreinoStore(
    repository: TreinoRepository(
    client: HttpClient()
  ));

  final List<TreinoModel> listaTreinos = [
    TreinoModel(id: "id", nome: "nome", diaSemana: "diaSemana"),
    TreinoModel(id: "id", nome: "nome", diaSemana: "diaSemana"),
    TreinoModel(id: "id", nome: "nome", diaSemana: "diaSemana"),
    TreinoModel(id: "id", nome: "nome", diaSemana: "diaSemana"),
    TreinoModel(id: "id", nome: "nome", diaSemana: "diaSemana"),
  ];

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Treino",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF7600F5),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/treinoAdd');
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
                child: Expanded(
                  child: ListView.builder(
                    itemCount: listaTreinos.length,
                    itemBuilder: (context, index) {
                      TreinoModel treinoModel = listaTreinos[index];
                       return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200], 
                              borderRadius: BorderRadius.circular(10.0), 
                            ),
                            child: ListTile(
                                 contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                              title: Text(treinoModel.nome),
                              subtitle: Text(treinoModel.diaSemana),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.edit, 
                                  color: Colors.purple, 
                                ),
                                 onPressed: () {
                                  Navigator.pushNamed(
                                    context, '/treinoEdit');
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 16), 
                        ],
                      );
                    },
                  ),
                ),
          ),
        ),
      );
  }
}


class BoxWithTitleAndSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const BoxWithTitleAndSubtitle({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
