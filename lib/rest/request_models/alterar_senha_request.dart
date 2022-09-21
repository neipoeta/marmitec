import 'package:json_annotation/json_annotation.dart';

part 'alterar_senha_request.g.dart';

@JsonSerializable(createToJson: true)
class AlterarSenhaRequest{
  String chave;
  String documento;
  String novaSenha;
  String senhaAtual;

  AlterarSenhaRequest(this.chave, this.documento, this.novaSenha, this.senhaAtual);
        factory AlterarSenhaRequest.fromJson(Map<String, dynamic> json) =>
      _$AlterarSenhaRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AlterarSenhaRequestToJson(this);
}
