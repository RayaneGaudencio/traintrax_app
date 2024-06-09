class TreinoModel {
    String id;
    String nome;
    String diaSemana;

    TreinoModel({
      required this.id, 
      required this.nome, 
      required this.diaSemana
    });


    factory TreinoModel.fromMap(Map<String, dynamic> map) {
      return TreinoModel(
        id: map["id"].toString(), 
        nome: map["nome"].toString(),
        diaSemana: map["diaSemana"].toString()
      );
    }


    Map<String, dynamic> toMap(){
      return {
        "id": id,
        "nome": nome,
        "diaSemana": diaSemana
      };
    }
}