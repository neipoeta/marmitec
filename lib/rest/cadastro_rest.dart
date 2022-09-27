import 'package:marmitec/rest/http_client.dart';
import 'package:marmitec/rest/request_models/cadastro_request.dart';

class CadastroRest extends HttpClient {
  //final AppConfig _appConfig = Get.find<AppConfig>();
  Future cadastrar(CadastroRequest request) async {
    httpClient.baseUrl = 'http://homologacao.passagensweb.net/EsipeMobile/api/';
    var requestJson = request.toJson();
    final response = await post('cadastraCliente', requestJson);

    if (response.statusCode == 200) {
      final result = response.statusText;
      return result;
    } else if (response.statusCode == 400) {
      const result = 'Erro no cadastro!';
      return result;
    } else if (response.statusCode == 500) {
      return null;
    }
    return throw Exception('Erro no cadastro!');
  }
}
