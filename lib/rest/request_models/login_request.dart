import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable(createToJson: true)
class LoginRequest {
  String key;
  String chave;
  String documento;
  String senha;
  bool sucesso;
  String mensagem;
  bool ignorarAtivo;
  String authProvider;
  String authId;
  String authToken;

  LoginRequest(this.key, this.chave, this.documento, this.senha, this.sucesso,
      this.mensagem, this.ignorarAtivo, this.authProvider, this.authId, this.authToken);
        factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
