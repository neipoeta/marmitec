import 'package:marmitec/rest/response_models/notificacao_response.dart';

import 'http_client.dart';

class NotificacaoRest extends HttpClient {
  //final AppConfig _appConfig = Get.find<AppConfig>();
  List<NotificacaoResponse> notificacao = [];

  Future obterNotificacaoApi(notificacaoRequest) async {
    var response = await get(montarUrlParaObterNotificacao(notificacaoRequest));
    if (response.statusCode == 200) {
      //_appConfig.appNotificacoes.clear();
      notificacao = (response.body as List)
          .map((e) => NotificacaoResponse.fromJson(e))
          .toList();
      return notificacao;
    }
  }

  String montarUrlParaObterNotificacao(notificacaoRequest) {
    String urlObterNotificacao = '';
    String chaveProjeto = notificacaoRequest.chaveProjeto;
    int id = notificacaoRequest.id;
    String documento = notificacaoRequest.documento;
    String uf = notificacaoRequest.uf;
    String cidade = notificacaoRequest.cidade;

    urlObterNotificacao =
        ('obterNotificacao?chaveProjeto=$chaveProjeto&id=$id&documento=$documento&uf=$uf&cidade=$cidade');

    return urlObterNotificacao;
  }
}
