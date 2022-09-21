// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CadastroRequest _$CadastroRequestFromJson(Map<String, dynamic> json) =>
    CadastroRequest(
      json['chaveProjeto'] as String,
      json['empresa'] as bool?,
      json['nomeContato'] as String?,
      json['nome'] as String,
      json['numeroDocumento'] as String,
      json['numeroDocumentoAntigo'] as String?,
      json['senha'] as String,
      json['dataNascimento'] as String,
      json['email'] as String,
      json['ddd'] as int,
      json['telefoneTipo'] as int,
      json['telefone'] as String,
      json['recebeEmailPromo'] as bool?,
      json['estado'] as int,
      json['cidade'] as String,
      json['selectedSMS'] as bool?,
      json['cep'] as int?,
      json['rua'] as String?,
      json['numero'] as String?,
      json['complemento'] as String?,
      json['bairro'] as String?,
      json['ativarAutomatico'] as String?,
      json['rg'] as String?,
    );

Map<String, dynamic> _$CadastroRequestToJson(CadastroRequest instance) =>
    <String, dynamic>{
      'chaveProjeto': instance.chaveProjeto,
      'empresa': instance.empresa,
      'nomeContato': instance.nomeContato,
      'nome': instance.nome,
      'numeroDocumento': instance.numeroDocumento,
      'numeroDocumentoAntigo': instance.numeroDocumentoAntigo,
      'senha': instance.senha,
      'dataNascimento': instance.dataNascimento,
      'email': instance.email,
      'ddd': instance.ddd,
      'telefoneTipo': instance.telefoneTipo,
      'telefone': instance.telefone,
      'recebeEmailPromo': instance.recebeEmailPromo,
      'estado': instance.estado,
      'cidade': instance.cidade,
      'selectedSMS': instance.selectedSMS,
      'cep': instance.cep,
      'rua': instance.rua,
      'numero': instance.numero,
      'complemento': instance.complemento,
      'bairro': instance.bairro,
      'ativarAutomatico': instance.ativarAutomatico,
      'rg': instance.rg,
    };


