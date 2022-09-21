import 'package:get/get.dart';

import '../recuperar_senha_rest.dart';

class RecuperarSenhaRestService extends GetxService {
  final RecuperarSenhaRest _recuperarRest;
  RecuperarSenhaRestService(this._recuperarRest);

  // Future<RecuperarSenhaResponse> recuperarSenha(RecuperarSenhaRequest recuperarSenhaRequest) async {
  //   var result = await _recuperarRest.recuperarSenha(recuperarSenhaRequest);
  //   return result;
  // }
}