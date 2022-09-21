import 'package:json_annotation/json_annotation.dart';

part 'notificacao_request.g.dart';

@JsonSerializable(createToJson: true)
class NotificacaoRequest {
  String? chaveProjeto;
  int? id;
  String? documento;
  String? uf;
  String? cidade;

  NotificacaoRequest({
    this.chaveProjeto,
    this.id,
    this.documento,
    this.uf,
    this.cidade,
  });
  factory NotificacaoRequest.fromJson(Map<String, dynamic> json) =>
      _$NotificacaoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NotificacaoRequestToJson(this);
}
