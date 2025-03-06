class Cep {
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;
  String estado;

  Cep({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.estado, 
});

  factory Cep.fromJson(Map<String, dynamic> json) {
    return Cep(
      cep: json['cep'] ?? "",
      logradouro: json['logradouro'] ?? "",
      complemento: json['complemento'] ?? "",
      bairro: json['bairro'] ?? "",
      localidade: json['localidade'] ?? "",
      uf: json['uf'] ?? "",
      estado: json['estado'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'estado': estado,
    };
  }

   @override
  String toString() {
    return '$logradouro\n$bairro\n$estado-$uf\n$cep';
  }

  
}
