import 'dart:convert';
import 'package:flutter_traintrax/data/models/treino_model.dart';
import 'package:http/http.dart' as http;

class TreinoService {
  static const String baseUrl = 'http://10.0.2.2:8080';
  static const String treinoEndpoint = '/treino/lista';

  static Future<List<TreinoModel>> fetchTreinos() async {
    final url = Uri.parse('$baseUrl$treinoEndpoint');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((item) => TreinoModel.fromMap(item)).toList();
    } else {
      throw Exception('Falha ao carregar treinos: ${response.statusCode}');
    }
  }
}
