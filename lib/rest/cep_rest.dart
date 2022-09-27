
import 'http_cep.dart';

class BuscaCepRest extends HttpCep{
  //final AppConfig _appConfig = Get.find<AppConfig>();
  
  Future buscarEstadoCidade(String cep) async {
    final response = await get('https://viacep.com.br/ws/$cep/json/');

    if (response.statusCode == 200) {
      final cidadeResult = (response.body['localidade']);
      final estadoResult = (response.body['uf']);

      return [cidadeResult, estadoResult];
    } else if (response.statusCode == 400) {
      const result = 'Erro no cadastro!';
      return result;
    } else if (response.statusCode == 500) {
      return null;
    }
    return throw Exception('Erro no cadastro!');
  }

  Future buscarCidadePorUF(String estadoSigla) async {
    final response = await get(
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$estadoSigla/distritos?orderBy=nome');
    if (response.statusCode == 200) {
      final cidadesResult = (response.body as List).map((e) {
        return e['nome'];
      }).toList();
      return cidadesResult;
    } else if (response.statusCode == 400) {
      const result = 'Erro no cadastro!';
      return result;
    } else if (response.statusCode == 500) {
      return null;
    }
    return throw Exception('Erro no cadastro!');
  }
}
