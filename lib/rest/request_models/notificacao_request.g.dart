// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificacao_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificacaoRequest _$NotificacaoRequestFromJson(Map<String, dynamic> json) =>
    NotificacaoRequest(
      chaveProjeto: json['chaveProjeto'] as String?,
      id: json['id'] as int?,
      documento: json['documento'] as String?,
      uf: json['uf'] as String?,
      cidade: json['cidade'] as String?,
    );

Map<String, dynamic> _$NotificacaoRequestToJson(NotificacaoRequest instance) =>
    <String, dynamic>{
      'chaveProjeto': instance.chaveProjeto,
      'id': instance.id,
      'documento': instance.documento,
      'uf': instance.uf,
      'cidade': instance.cidade,
    };
