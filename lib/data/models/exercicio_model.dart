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
    : id = map["id"].toString(),
      nome = map["nome"].toString(),
      series = map["series"].toString(),
      repeticoes = map["repeticoes"].toString();

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "series": series,
      "repeticoes": repeticoes
    };
  }
}