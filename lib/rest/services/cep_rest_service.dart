import 'package:get/get.dart';

import '../cep_rest.dart';

class BuscaCepRestService extends GetxService {
  final BuscaCepRest _buscaCepRest;
  BuscaCepRestService(this._buscaCepRest);

  Future buscarEstadoCidade(String cep) async {
    var responseCep = await _buscaCepRest.buscarEstadoCidade(cep);

    return responseCep;
  }

  Future buscarCidadePorUF(String estadoSigla) async {
    var responseBuscaPorUF = await _buscaCepRest.buscarCidadePorUF(estadoSigla);

    return responseBuscaPorUF;
  }
  
}