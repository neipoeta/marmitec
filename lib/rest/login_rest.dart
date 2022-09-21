
import 'package:marmitec/rest/request_models/login_request.dart';
import 'package:marmitec/rest/response_models/login_response.dart';

import 'http_client.dart';

class LoginRest extends HttpClient {
  Future logar(LoginRequest request) async {
    final response = await post('autorizacao', request.toJson());

    if (response.statusCode == 200) {
      final result = LoginResponse.fromJson(response.body['cliente']);
      if (response.statusText == 'OK') {
        try {
          String senha = request.senha;
          //result.senha = md5.convert(utf8.encode(senha)).toString();
          return result;
        } catch (e) {
          throw (response.body['mensagem'] == ''
              ? 'Erro ao logar - Favor verificar os dados informados'
              : response.body['mensagem']);
        }
      } else {
        return result.mensagem.toString();
      }
    }
  }
}
