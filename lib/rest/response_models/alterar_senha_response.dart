import 'package:json_annotation/json_annotation.dart';

part 'alterar_senha_response.g.dart';

@JsonSerializable(createToJson: true)
class AlterarSenhaResponse {
  AlterarSenhaResponse(
      this.mensagem,);

  dynamic mensagem;

  factory AlterarSenhaResponse.fromJson(Map<String, dynamic> json) =>
      _$AlterarSenhaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AlterarSenhaResponseToJson(this);
}
