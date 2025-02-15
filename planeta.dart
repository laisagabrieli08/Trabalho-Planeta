class Planeta {
  int? id;
  String nome;
  double tamanho;
  double distancia;
  String? apelido;

  Planeta({
    required this.id,
    required this.nome,
    required this.tamanho,
    required this.distancia,
    required this.apelido,
  });


 Planeta.vazio()
     : nome = '',
       tamanho = 0.0,
       distancia = 0.0,
       apelido = '';
}
