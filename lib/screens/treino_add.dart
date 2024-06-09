import 'package:flutter/material.dart';
import 'package:flutter_traintrax/components/decoration_input.dart';
import 'package:flutter_traintrax/data/http/treino_service.dart';
import 'package:flutter_traintrax/screens/home.dart';

class TreinoAdd extends StatefulWidget {
  TreinoAdd({Key? key}) : super(key: key);

  @override
  State<TreinoAdd> createState() => _TreinoAddState();
}

class _TreinoAddState extends State<TreinoAdd> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _diaSemanaController = TextEditingController();
  bool _showTreinoInfo = false;
  bool _showForm = true;
  String _nomeTreino = '';
  String _diaSemana = '';

  void _adicionarTreino() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );

      try {
        final treino = await TreinoService.addTreino(
          _nomeController.text,
          _diaSemanaController.text,
        );

        setState(() {
          _showTreinoInfo = true;
          _showForm = false; // Oculta o formulário após adicionar o treino
          _nomeTreino = treino.nome;
          _diaSemana = treino.diaSemana;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao adicionar treino: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Treino",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF7600F5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _showForm ? _buildForm() : _buildTreinoInfo(),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            controller: _nomeController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório.';
              }
              return null;
            },
            decoration: getInput("Nome do Treino"),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _diaSemanaController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório.';
              }
              return null;
            },
            decoration: getInput("Dia da Semana"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _adicionarTreino,
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all<Color>(const Color(0xFF7600F5)),
            ),
            child: const Text(
              'Adicionar Treino',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildTreinoInfo() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Row(
        children: [
          Expanded(
            child: Text(
              _nomeTreino, 
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.purple[700],
            ),
            iconSize: 30,
            onPressed: () {
              Navigator.pushNamed(context, '/treinoEdit');
            },
          ),
        ],
      ),
      const SizedBox(height: 8.0),
      Text(
        _diaSemana, 
        style: TextStyle(fontSize: 16),
      ),
    ],
  );
}

}
