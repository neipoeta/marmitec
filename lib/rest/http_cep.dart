import 'package:get/get.dart';

class HttpCep extends GetConnect {
  @override
  void onInit() {

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

  Future<Response<T>> onException<T>(Object? e) {
    // if (e is GetHttpException &&
    //     (e.message.contains('timed out') ||
    //         e.message.contains('Host is down'))) {
    //   var mensagem =
    //       'Não foi possível conectar ao servidor, por favor verifique sua conexão e tente novamente';
    //   DialogPadrao.atencao(mensagem);
    //   throw e;
    // }

    throw e as Exception;
  }
}
