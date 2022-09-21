import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

class HttpClient extends GetConnect {
  final bool _mensagemController = false;
  bool ehProducao = false;
  @override
  void onInit() {
    httpClient.baseUrl = ehProducao
        ? 'http://ecommerce-hml-api.rodosoft.com.br/api/'
        : 'http://homologacao.passagensweb.net/EsipeMobile/api/'; //local'http://192.168.0.59:60019/api/'
    httpClient.errorSafety = false;
    httpClient.maxAuthRetries = 1;
    httpClient.maxRedirects = 1;
    httpClient.timeout = const Duration(seconds: 40);
  }

  @override
  Future<Response<T>> put<T>(String url, body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) {
    return super
        .put(url, body,
            contentType: contentType,
            headers: headers,
            query: query,
            decoder: decoder,
            uploadProgress: uploadProgress)
        .onError((e, s) {
      return onException(e);
    });
  }

  @override
  Future<Response<T>> patch<T>(String url, body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) {
    return super
        .patch(url, body,
            contentType: contentType,
            headers: headers,
            query: query,
            decoder: decoder,
            uploadProgress: uploadProgress)
        .onError((e, s) {
      return onException(e);
    });
  }

  @override
  Future<Response<T>> delete<T>(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query,
      Decoder<T>? decoder}) {
    return super
        .delete(url,
            headers: headers,
            contentType: contentType,
            query: query,
            decoder: decoder)
        .onError((e, s) {
      return onException(e);
    });
  }

  @override
  Future<Response<T>> get<T>(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query,
      Decoder<T>? decoder}) {
    return super
        .get(url,
            headers: headers,
            contentType: contentType,
            query: query,
            decoder: decoder)
        .onError((e, s) {
      return onException(e);
    });
  }

  @override
  Future<Response<T>> post<T>(String? url, body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) {
    return super
        .post(url, body,
            contentType: contentType,
            headers: headers,
            query: query,
            decoder: decoder,
            uploadProgress: uploadProgress)
        .onError((e, s) {
      return onException(e);
    });
  }

  /// o método addResponseModifier detecta apenas casos onde a API deu retorno
  /// Em casos como timeout é necessário tratar dentro deste método
  /// Pois o timeout não cai dentro do addResponseModifier
  Future<Response<T>> onException<T>(Object? e) {
    // if (!_mensagemController) {
    //   if (e is GetHttpException &&
    //       (e.message.contains('timed out') ||
    //           e.message.contains('Host is down'))) {
    //     var mensagem =
    //         'Não foi possível conectar ao servidor, por favor verifique sua conexão e tente novamente';
    //     DialogPadrao.atencao(mensagem);
    //     _mensagemController = true;
    //     throw e;
    //   }
    // }

    throw e as Exception;
  }
}
