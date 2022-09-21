import 'package:json_annotation/json_annotation.dart';

part 'notificacao_response.g.dart';

@JsonSerializable(createToJson: true)
class NotificacaoResponse {
  int? id;
  String? tituloNotificacao;
  String? mensagemNotificacao;
  DateTime? dataInicialNotificacao;
  DateTime? dataFinalNotificacao;
  String? origemNotificacao;
  String? destinoNotificacao;
  String? horaNotificacao;
  bool? temNotificacao;
  int? tipoNotificacao;
  DateTime? dataExibicaoNotificacao;
  bool? notificacaoAgendada;

  NotificacaoResponse({
    this.id,
    this.tituloNotificacao,
    this.mensagemNotificacao,
    this.dataInicialNotificacao,
    this.dataFinalNotificacao,
    this.origemNotificacao,
    this.destinoNotificacao,
    this.horaNotificacao,
    this.temNotificacao,
    this.tipoNotificacao,
    this.dataExibicaoNotificacao,
    this.notificacaoAgendada
  });
  factory NotificacaoResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificacaoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificacaoResponseToJson(this);
}
