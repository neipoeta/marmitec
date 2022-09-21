import 'package:get/get.dart';

import '../notificacoes_rest.dart';
import '../response_models/notificacao_response.dart';

class NotificacaoRestService extends GetxService {
  final NotificacaoRest _notificacaoRest;
  NotificacaoRestService(this._notificacaoRest);

  Future<List<NotificacaoResponse>> obterNotificacaoApi(notificacaoRequest) async {
    var responseObterNotificacao = await _notificacaoRest.obterNotificacaoApi(notificacaoRequest);

    return responseObterNotificacao;
  }
}
