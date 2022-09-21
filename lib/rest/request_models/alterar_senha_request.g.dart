// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alterar_senha_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlterarSenhaRequest _$AlterarSenhaRequestFromJson(Map<String, dynamic> json) =>
    AlterarSenhaRequest(
      json['chave'] as String,
      json['documento'] as String,
      json['novaSenha'] as String,
      json['senhaAtual'] as String,
    );

Map<String, dynamic> _$AlterarSenhaRequestToJson(
        AlterarSenhaRequest instance) =>
    <String, dynamic>{
      'chave': instance.chave,
      'documento': instance.documento,
      'novaSenha': instance.novaSenha,
      'senhaAtual': instance.senhaAtual,
    };
