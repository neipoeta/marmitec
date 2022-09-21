// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificacao_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificacaoResponse _$NotificacaoResponseFromJson(Map<String, dynamic> json) =>
    NotificacaoResponse(
      id: json['id'] as int?,
      tituloNotificacao: json['tituloNotificacao'] as String?,
      mensagemNotificacao: json['mensagemNotificacao'] as String?,
      dataInicialNotificacao: json['dataInicialNotificacao'] == null
          ? null
          : DateTime.parse(json['dataInicialNotificacao'] as String),
      dataFinalNotificacao: json['dataFinalNotificacao'] == null
          ? null
          : DateTime.parse(json['dataFinalNotificacao'] as String),
      origemNotificacao: json['origemNotificacao'] as String?,
      destinoNotificacao: json['destinoNotificacao'] as String?,
      horaNotificacao: json['horaNotificacao'] as String?,
      temNotificacao: json['temNotificacao'] as bool?,
      tipoNotificacao: json['tipoNotificacao'] as int?,
      dataExibicaoNotificacao: json['dataExibicaoNotificacao'] == null
          ? null
          : DateTime.parse(json['dataExibicaoNotificacao'] as String),
      notificacaoAgendada: json['notificacaoAgendada'] as bool?,
    );

Map<String, dynamic> _$NotificacaoResponseToJson(
        NotificacaoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tituloNotificacao': instance.tituloNotificacao,
      'mensagemNotificacao': instance.mensagemNotificacao,
      'dataInicialNotificacao':
          instance.dataInicialNotificacao?.toIso8601String(),
      'dataFinalNotificacao': instance.dataFinalNotificacao?.toIso8601String(),
      'origemNotificacao': instance.origemNotificacao,
      'destinoNotificacao': instance.destinoNotificacao,
      'horaNotificacao': instance.horaNotificacao,
      'temNotificacao': instance.temNotificacao,
      'tipoNotificacao': instance.tipoNotificacao,
      'dataExibicaoNotificacao':
          instance.dataExibicaoNotificacao?.toIso8601String(),
      'notificacaoAgendada': instance.notificacaoAgendada,
    };
