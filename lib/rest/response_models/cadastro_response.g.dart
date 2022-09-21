// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CadastroResponse _$CadastroResponseFromJson(Map<String, dynamic> json) =>
    CadastroResponse(
      json['nome'] as String?,
      json['numeroDocumento'] as String,
      json['passageiros'] as List<dynamic>,
      json['receberEmail'] as int,
      json['mensagem'] as String?,
      json['ignorarAtivo'] as bool?,
      DateTime.parse(json['dataInclusao'] as String),
      json['dataNascimento'] as String?,
      json['emails'] as List<dynamic>,
      json['enderecos'] as List<dynamic>,
      json['listaCartoes'] as List<dynamic>?,
      json['logarEmail'] as bool,
      json['nomeBusca'] as String,
      json['possuiFilhos'] as bool?,
      json['quantidadeFilhos'] as int?,
      json['recebeDesconto'] as bool,
      json['receberEmailPromocional'] as bool,
      json['receberSms'] as bool,
      json['sexo'] as int?,
      json['statusCliente'] as int,
      json['telefones'] as List<dynamic>,
      json['tipoCliente'] as int,
      json['tipoDocumento'] as int,
      json['senha'] as String?,
    )
      ..logado = json['logado'] as bool?
      ..email = json['email'] as String?
      ..emailPrincipal = json['emailPrincipal']
      ..enderecoPrincipal = json['enderecoPrincipal']
      ..id = json['id'] as int?
      ..ip = json['ip'] as String?
      ..nivel = json['nivel'] as int?
      ..nomeContato = json['nomeContato'] as String?
      ..senhaCliente = json['senhaCliente'] as String?;

Map<String, dynamic> _$CadastroResponseToJson(CadastroResponse instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'numeroDocumento': instance.numeroDocumento,
      'passageiros': instance.passageiros,
      'receberEmail': instance.receberEmail,
      'mensagem': instance.mensagem,
      'ignorarAtivo': instance.ignorarAtivo,
      'logado': instance.logado,
      'dataInclusao': instance.dataInclusao.toIso8601String(),
      'dataNascimento': instance.dataNascimento,
      'email': instance.email,
      'emailPrincipal': instance.emailPrincipal,
      'emails': instance.emails,
      'enderecoPrincipal': instance.enderecoPrincipal,
      'enderecos': instance.enderecos,
      'id': instance.id,
      'ip': instance.ip,
      'listaCartoes': instance.listaCartoes,
      'logarEmail': instance.logarEmail,
      'nivel': instance.nivel,
      'nomeBusca': instance.nomeBusca,
      'nomeContato': instance.nomeContato,
      'possuiFilhos': instance.possuiFilhos,
      'quantidadeFilhos': instance.quantidadeFilhos,
      'recebeDesconto': instance.recebeDesconto,
      'receberEmailPromocional': instance.receberEmailPromocional,
      'receberSms': instance.receberSms,
      'senhaCliente': instance.senhaCliente,
      'sexo': instance.sexo,
      'statusCliente': instance.statusCliente,
      'telefones': instance.telefones,
      'tipoCliente': instance.tipoCliente,
      'tipoDocumento': instance.tipoDocumento,
      'senha': instance.senha,
    };
