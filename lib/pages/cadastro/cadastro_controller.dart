import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../rest/request_models/cadastro_request.dart';
import '../../rest/services/cadastro_rest_service.dart';
import '../../rest/services/cep_rest_service.dart';


class CadastroController extends GetxController with StateMixin {
  CadastroController(this._cadastroRestService, this._buscaCepRestService);

  //final AppConfig _appConfig = Get.find<AppConfig>();
  
  RxBool disabledCamposEstadoCidade = RxBool(true);
  bool isEmpresa = false;
  final CadastroRestService _cadastroRestService;
  final BuscaCepRestService _buscaCepRestService;

  final TextEditingController nomeClienteController = TextEditingController();
  final TextEditingController nomeContatoController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmSenhaController = TextEditingController();
  final TextEditingController rgClienteController = TextEditingController();
  final TextEditingController cpfClienteController = TextEditingController();
  final TextEditingController cnpjClienteController = TextEditingController();
  final TextEditingController tipoDocumentoController = TextEditingController();
  final TextEditingController emailClienteController = TextEditingController();
  final TextEditingController emailConfirmeController = TextEditingController();
  final TextEditingController tipoTelefoneController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController dddClienteController = TextEditingController();
  final TextEditingController estadoClienteController = TextEditingController();
  final TextEditingController cidadeClienteController = TextEditingController();
  final TextEditingController cepClienteController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    change(null, status: RxStatus.loading());
    await buscarCidade('AC');
    change(null, status: RxStatus.success());
  }

  Future cadastrar(
      isEmpresa,
      nomeContato,
      nome,
      rg,
      senha,
      documento,
      email,
      dddTelefone,
      telefoneTipo,
      telefone,
      recebeEmailPromo,
      estado,
      cidade,
      cep) async {
    try {
      final CadastroRequest cadastroRequest = CadastroRequest(
          '_appConfig.chaveProjeto',
          isEmpresa,
          nomeContato,
          nome,
          documento,
          '',
          senha,
          '',
          email,
          dddTelefone,
          1, //Era enum
          telefone,
          recebeEmailPromo,
          20, //Era Enum
          cidade,
          false,
          cep,
          '',
          '',
          '',
          '',
          '',
          rg);
      final resposta = await _cadastroRestService.cadastrar(cadastroRequest);
      return resposta;
    } catch (e) {
      return e.toString();
    }
  }

  buscarEstadoCidadeCep(cep) async {
    var respostaCep = await _buscaCepRestService.buscarEstadoCidade(cep);

    if (respostaCep != 'Erro no cadastro!') {
      //estadoSelecionadoCep.value = true;
      disabledCamposEstadoCidade.value = false;

      estadoClienteController.text = respostaCep[1].toString();
      cidadeClienteController.text = respostaCep[0].toString();
    } else {
      //estadoSelecionadoCep.value = false;
      disabledCamposEstadoCidade.value = true;
    }

  }

  buscarCidade(estadoSigla) async {
    var respostaBuscaPorUf =
        await _buscaCepRestService.buscarCidadePorUF(estadoSigla);
    //_appConfig.cidades.value = respostaBuscaPorUf;
    return respostaBuscaPorUf;
  }
  

    String removerAcentos(String str) {
    var comAcento =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var semAcento =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

    for (int i = 0; i < comAcento.length; i++) {
      str = str.replaceAll(comAcento[i], semAcento[i]);
    }

    return str;
  }
}
