import 'dart:convert';

import 'package:flutter_traintrax/data/http/exceptions.dart';
import 'package:flutter_traintrax/data/http/http_client.dart';
import 'package:flutter_traintrax/data/models/treino_model.dart';

abstract class ITreinoRepository {
  Future<List<TreinoModel>> getTreinos();
}

class TreinoRepository implements ITreinoRepository {

  final IHttpClient client;

  TreinoRepository({required this.client});

  @override
  Future<List<TreinoModel>> getTreinos() async {
    final response = await client.get(url: 'http://localhost:8080/treino/lista');

    if (response.statusCode == 200) {
      final List<TreinoModel> treinos = [];

      final body = jsonDecode(response.body);

      body[''].map((item) {
        final TreinoModel treino = TreinoModel.fromMap(item);
        treinos.add(treino);
      }).toList();
      return treinos;
    } else if (response.statusCode == 404) {
      throw NotFoundException("A url informada não é válida.");
    } else {
      throw Exception("Não foi possível carregar os treinos.");
    }

  }
}