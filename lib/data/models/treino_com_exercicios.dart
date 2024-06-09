import 'package:flutter_traintrax/data/models/exercicio_model.dart';

class TreinoComExerciciosModel {
  String id;
  String nome;
  String diaSemana;
  List<ExercicioModel> exercicios;

  TreinoComExerciciosModel({
    required this.id,
    required this.nome,
    required this.diaSemana,
    required this.exercicios,
  });

  factory TreinoComExerciciosModel.fromMap(Map<String, dynamic> map) {
    return TreinoComExerciciosModel(
      id: map["treino"]["id"].toString(),
      nome: map["treino"]["nome"].toString(),
      diaSemana: map["treino"]["diaSemana"].toString(),
      exercicios: List<ExercicioModel>.from(map["exercicios"].map((x) => ExercicioModel.fromMap(x))),
    );
  }
}
