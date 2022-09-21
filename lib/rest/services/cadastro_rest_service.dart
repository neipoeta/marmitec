import 'package:get/get.dart';

import '../cadastro_rest.dart';
import '../request_models/cadastro_request.dart';

class CadastroRestService extends GetxService {
  final CadastroRest _cadastroRest;
  CadastroRestService(this._cadastroRest);

  Future<String> cadastrar(CadastroRequest cadastroRequest) async {
    var result = await _cadastroRest.cadastrar(cadastroRequest);
    return result;
  }
}