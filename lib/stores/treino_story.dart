import 'package:flutter/material.dart';
import 'package:flutter_traintrax/data/http/exceptions.dart';
import 'package:flutter_traintrax/data/models/treino_model.dart';
import 'package:flutter_traintrax/data/repositories/treino_repository.dart';

class TreinoStore {
  final ITreinoRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<TreinoModel>> state =
      ValueNotifier<List<TreinoModel>>([]);

  final ValueNotifier<String> erro = ValueNotifier<String>('');

  TreinoStore({required this.repository});

  Future getTreinos() async {
    isLoading.value = true;

    try {
      final result = await repository.getTreinos();
      state.value = result;
    } on NotFoundException  catch (e) {
      erro.value = e.message;
    }
    catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}