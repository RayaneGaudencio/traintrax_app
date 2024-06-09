class ExercicioModel {
  String id;
  String nome;
  String series;
  String repeticoes;

  ExercicioModel({
    required this.id, 
    required this.nome, 
    required this.series,
    required this.repeticoes
  });

  ExercicioModel.fromMap(Map<String, dynamic> map)
    : id = map["id"],
      nome = map["nome"],
      series = map["series"],
      repeticoes = map["repeticoes"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "series": series,
      "repeticoes": repeticoes
    };
  }
}