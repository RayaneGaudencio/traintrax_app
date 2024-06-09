import 'dart:convert';
import 'package:flutter_traintrax/data/models/treino_com_exercicios.dart';
import 'package:flutter_traintrax/data/models/treino_model.dart';
import 'package:http/http.dart' as http;

class TreinoService {
  static const String baseUrl = 'http://10.0.2.2:8080';
  static const String treinoEndpoint = '/treino/lista';
  static const String listarExercicios = '/treino/listar_exercicio/';
  static const String cadastrarTreino = '/treino';

  static Future<List<TreinoModel>> fetchTreinos() async {
    final url = Uri.parse('$baseUrl$treinoEndpoint');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final utf8Response = utf8.decode(response.bodyBytes);
      final data = jsonDecode(utf8Response) as List;
      return data.map((item) => TreinoModel.fromMap(item)).toList();
    } else {
      throw Exception('Falha ao carregar treinos: ${response.statusCode}');
    }
  }

  static Future<List<TreinoComExerciciosModel>> getTreinoAndExercicios(String treinoId) async {
    final url = Uri.parse('$baseUrl$listarExercicios$treinoId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final utf8Response = utf8.decode(response.bodyBytes);
      final data = jsonDecode(utf8Response) as Map<String, dynamic>;
      final treino = TreinoComExerciciosModel.fromMap(data);
      return [treino]; 
    } else {
      throw Exception('Falha ao carregar treinos: ${response.statusCode}');
    }
  }

 static Future<TreinoModel> addTreino(String nome, String diaSemana) async {
    final url = Uri.parse('$baseUrl$cadastrarTreino');
    
    final Map<String, dynamic> requestBody = {
      'nome': nome,
      'diaSemana': diaSemana,
    };

    final response = await http.post(
      url,
      body: jsonEncode(requestBody),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final utf8Response = utf8.decode(response.bodyBytes);
      final data = jsonDecode(utf8Response) as Map<String, dynamic>;
      final treino = TreinoModel.fromMap(data);
      return treino; 
    } else {
      throw Exception('Falha ao cadastrar treino: ${response.statusCode}');
    }
  }
}
