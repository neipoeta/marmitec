import 'package:json_annotation/json_annotation.dart';

part 'recuperar_senha_response.g.dart';

@JsonSerializable(createToJson: true)
class RecuperarSenhaResponse {
  RecuperarSenhaResponse(
      this.numeroDocumento,);

  dynamic numeroDocumento;

  factory RecuperarSenhaResponse.fromJson(Map<String, dynamic> json) =>
      _$RecuperarSenhaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecuperarSenhaResponseToJson(this);
}
