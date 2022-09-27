import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ClienteController extends GetxController with StateMixin {
  ClienteController();

  //final AppConfig _appConfig = Get.find<AppConfig>();

  String get dataIdaUrl => dataIdaController.value.text;
  String get dataVoltaUrl => dataVoltaController.value.text;


  String origemUrl = '';
  String destinoUrl = '';

  TextEditingController dataIdaController = TextEditingController();
  TextEditingController dataVoltaController = TextEditingController();


  RxBool inverteOrigemDestino = RxBool(true);
  RxBool mostraDestinos = true.obs;

  bool camposOk = false;
  bool fezTrocaDeOrigemDestino = false;

  String ip = '';

  @override
  Future<void> onInit() async {
    super.onInit();

    try {
      change(null, status: RxStatus.loading());


      change(null, status: RxStatus.success());
    } on Exception {
      //GravaErroInesperado()(exception: e, stack: StackTrace.current);

      change(
          'Não foi possível conectar ao servidor, verifique sua conexão com a internet e tente novamente',
          status: RxStatus.error());
    }
  }


  String verificarPlataforma() {
    if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'IOS';
    } else {
      return '';
    }
  }

  String removerAcentos(String str) {
    var comAcento =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var semAcento =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

    for (int i = 0; i < comAcento.length; i++) {
      str = str.replaceAll(comAcento[i], semAcento[i]);
    }

    return str;
  }

  void inverterOrigemDestino() {
    fezTrocaDeOrigemDestino = true;

    String aux = origemUrl;
    origemUrl = destinoUrl;
    destinoUrl = aux;

    inverteOrigemDestino.value =
        inverteOrigemDestino.value == false ? true : false;
  }
}
