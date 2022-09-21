import 'package:json_annotation/json_annotation.dart';

part 'cadastro_request.g.dart';

@JsonSerializable(createToJson: true)
class CadastroRequest {
  String chaveProjeto;
  bool? empresa;
  String? nomeContato;
  String nome;
  String numeroDocumento;
  String? numeroDocumentoAntigo;
  String senha;
  String dataNascimento;
  String email;
  int ddd;
  int telefoneTipo;
  String telefone;
  bool? recebeEmailPromo;
  int estado;
  String cidade;
  bool? selectedSMS;
  int? cep;
  String? rua;
  String? numero;
  String? complemento;
  String? bairro;
  String? ativarAutomatico;
  String? rg;

  CadastroRequest(
      this.chaveProjeto,
      this.empresa,
      this.nomeContato,
      this.nome,
      this.numeroDocumento,
      this.numeroDocumentoAntigo,
      this.senha,
      this.dataNascimento,
      this.email,
      this.ddd,
      this.telefoneTipo,
      this.telefone,
      this.recebeEmailPromo,
      this.estado,
      this.cidade,
      this.selectedSMS,
      this.cep,
      this.rua,
      this.numero,
      this.complemento,
      this.bairro,
      this.ativarAutomatico,
      this.rg);
  factory CadastroRequest.fromJson(Map<String, dynamic> json) =>
      _$CadastroRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CadastroRequestToJson(this);
}
