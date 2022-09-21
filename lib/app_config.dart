import 'package:get/get.dart';

class AppConfig extends GetxController {
  AppConfig(this.appName, this.flavorName, this.chaveProjeto);
  final String appName;
  final String flavorName;
  final String chaveProjeto;
  //LoginResponse? usuarioLogado;
  RxList cidades = RxList<dynamic>();
  String tempoCompras = '';
  String erroVoucher = '';
  String urlHorarios = '';
  int ultimoIdNotificacao = 0;
}

class AppConfigBindings extends Bindings {
  final String appName;
  final String flavorName;
  final String chaveProjeto;
  //late LoginResponse usuarioLogado;
  String tempoCompras = '';
  String? erroVoucher = '';
  String? urlHorarios = '';
  int ultimoIdNotificacao = 0;

  AppConfigBindings(this.appName, this.flavorName, this.chaveProjeto);

  @override
  void dependencies() {
    Get.lazyPut(() => AppConfig(appName, flavorName, chaveProjeto),
        fenix: true);
  }
}
