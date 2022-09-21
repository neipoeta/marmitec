// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      json['key'] as String,
      json['chave'] as String,
      json['documento'] as String,
      json['senha'] as String,
      json['sucesso'] as bool,
      json['mensagem'] as String,
      json['ignorarAtivo'] as bool,
      json['authProvider'] as String,
      json['authId'] as String,
      json['authToken'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'key': instance.key,
      'chave': instance.chave,
      'documento': instance.documento,
      'senha': instance.senha,
      'sucesso': instance.sucesso,
      'mensagem': instance.mensagem,
      'ignorarAtivo': instance.ignorarAtivo,
      'authProvider': instance.authProvider,
      'authId': instance.authId,
      'authToken': instance.authToken,
    };
