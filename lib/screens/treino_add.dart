import 'package:flutter/material.dart';
import 'package:flutter_traintrax/components/decoration_input.dart';
import 'package:flutter_traintrax/data/models/exercicio_model.dart';
import 'package:flutter_traintrax/data/models/treino_model.dart';

class TreinoAdd extends StatefulWidget {
  TreinoAdd({Key? key}) : super(key: key);

  @override
  State<TreinoAdd> createState() => _TreinoAddState();
}

class _TreinoAddState extends State<TreinoAdd> {
  final TreinoModel treinoModel = TreinoModel(
    id: "1", 
    nome: "nome", 
    diaSemana: "segunda"
  );

  final List<ExercicioModel> listaExercicios = [
    ExercicioModel(id: "id", nome: "nome", series: "series", repeticoes: "repeticoes"),
    ExercicioModel(id: "id", nome: "nome", series: "series", repeticoes: "repeticoes"),
    ExercicioModel(id: "id", nome: "nome", series: "series", repeticoes: "repeticoes"),
    ExercicioModel(id: "id", nome: "nome", series: "series", repeticoes: "repeticoes"),
    ExercicioModel(id: "id", nome: "nome", series: "series", repeticoes: "repeticoes"),
    ExercicioModel(id: "id", nome: "nome", series: "series", repeticoes: "repeticoes"),
    ExercicioModel(id: "id", nome: "nome", series: "series", repeticoes: "repeticoes"),
    ExercicioModel(id: "id", nome: "nome", series: "series", repeticoes: "repeticoes"),
    ExercicioModel(id: "id", nome: "nome", series: "series", repeticoes: "repeticoes"),
    ExercicioModel(id: "id", nome: "nome", series: "series", repeticoes: "repeticoes"),
    ExercicioModel(id: "id", nome: "nome", series: "series", repeticoes: "repeticoes"),
    ExercicioModel(id: "id", nome: "nome", series: "series", repeticoes: "repeticoes"),
    ExercicioModel(id: "id", nome: "nome", series: "series", repeticoes: "repeticoes"),
    ExercicioModel(id: "id", nome: "nome", series: "series", repeticoes: "repeticoes"),
    ExercicioModel(id: "id", nome: "nome", series: "series", repeticoes: "repeticoes"),
    ExercicioModel(id: "id", nome: "nome", series: "series", repeticoes: "repeticoes"),
    ExercicioModel(id: "id", nome: "nome", series: "series", repeticoes: "repeticoes"),
    ExercicioModel(id: "id", nome: "nome", series: "series", repeticoes: "repeticoes"),
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration:getInput("Nome do Treino")
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration:getInput("Dia da Semana")
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                  style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF7600F5)), 
                ),
                child: const Text(
                  'Adicionar Treino',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18 
                ),
                )
              ),
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
              Expanded(
                child: ListView.builder(
                  itemCount: listaExercicios.length,
                  itemBuilder: (context, index) {
                    ExercicioModel exercicioModel = listaExercicios[index];
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200], 
                            borderRadius: BorderRadius.circular(10.0), 
                          ),
                          child: ListTile(
                               contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                            title: Text(exercicioModel.nome),
                            subtitle: Text("${exercicioModel.series} - ${exercicioModel.repeticoes}"),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.edit, 
                                color: Colors.purple, 
                              ),
                               onPressed: () {
                                Navigator.pushNamed(
                                  context, '/exercicioEdit');
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
            ]
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
