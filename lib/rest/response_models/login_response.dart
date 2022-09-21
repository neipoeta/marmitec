import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(createToJson: true)
class LoginResponse {
  LoginResponse(
    this.nome,
    this.numeroDocumento,
    this.passageiros,
    this.receberEmail,
    this.mensagem,
    this.ignorarAtivo,
    this.dataInclusao,
    this.dataNascimento,
    this.emails,
    this.enderecos,
    this.listaCartoes,
    this.logarEmail,
    this.nomeBusca,
    this.possuiFilhos,
    this.quantidadeFilhos,
    this.recebeDesconto,
    this.receberEmailPromocional,
    this.receberSms,
    this.sexo,
    this.statusCliente,
    this.telefones,
    this.tipoCliente,
    this.tipoDocumento,
    this.senha,
  );

  String? nome;
  String numeroDocumento;
  List passageiros;
  int receberEmail;
  String? mensagem;
  bool? ignorarAtivo;
  bool? logado;
  DateTime dataInclusao;
  String? dataNascimento;
  String? email;
  dynamic emailPrincipal;
  List emails;
  dynamic enderecoPrincipal;
  List enderecos;
  int? id;
  String? ip;
  List? listaCartoes;
  bool logarEmail;
  int? nivel;
  String nomeBusca;
  String? nomeContato;
  bool? possuiFilhos;
  int? quantidadeFilhos;
  bool recebeDesconto;
  bool receberEmailPromocional;
  bool receberSms;
  String? senhaCliente;
  int? sexo;
  int statusCliente;
  List telefones;
  int tipoCliente;
  int tipoDocumento;
  String? senha;
  String? rg;
  String? cep;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
