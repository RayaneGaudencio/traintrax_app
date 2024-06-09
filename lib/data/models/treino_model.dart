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
        id: map["id"], 
        nome: map["nome"],
        diaSemana: map["diaSemana"]
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