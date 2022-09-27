import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:marmitec/rest/request_models/notificacao_request.dart';

import '../../rest/response_models/notificacao_response.dart';
import '../../rest/services/notificacoes_rest_service.dart';

class NotificacoesController extends GetxController {
  //final AppConfig _appConfig = Get.find<AppConfig>();
  final NotificacaoRestService _notificacaoRestService;
  late String? mensagemNotificacao = "";
  late String? tituloNotificacao = "";
  late String channelNotificacao = "";
  late NotificacaoRequest notificacaoRequest = NotificacaoRequest();
  bool temNotificacaoNoAppConfig = false;
  NotificacoesController(this._notificacaoRestService);
  DateTime dataAtualApp = DateTime.now();

  Future obterNotificacaoApi() async {
    List<NotificacaoResponse> responseNotificacao;
    try {
      obterNotificacaoRequest();
      // responseNotificacao =
      //     await _notificacaoRestService.obterNotificacaoApi(notificacaoRequest);
      //return verificarTipoNotificacao(responseNotificacao);
    } on Exception {
      throw "Nao retornou notificacao";
    }
  }

  NotificacaoRequest obterNotificacaoRequest() {
    try {
      notificacaoRequest = NotificacaoRequest(
        chaveProjeto: '_appConfig.chaveProjeto',
        id: 55,
        documento: '',
        uf: '',
        cidade: '',
      );
      // if (_appConfig.usuarioLogado != null) {
      //   notificacaoRequest.documento =
      //       _appConfig.usuarioLogado!.numeroDocumento;
      //   notificacaoRequest.uf =
      //       _appConfig.usuarioLogado!.enderecoPrincipal['siglaEstado'];
      //   notificacaoRequest.cidade =
      //       _appConfig.usuarioLogado!.enderecoPrincipal['cidade'];
      // }
      return notificacaoRequest;
    } on Exception {
      throw "Nao montou notificacao request";
    }
  }

  void verificarTipoNotificacao(List<NotificacaoResponse> notificacoes) async {
    await inicializarNotificacao();
    for (var notificacao in notificacoes) {
      montarNotificacaoDetalhes(notificacao);
      switch (notificacao.tipoNotificacao) {
        case 0:
          criarNotificacao();
          break;
        case 1:
          await gravarNotificacaoNoApp(notificacao);
          break;
      }
    }
  }

  Future gravarNotificacaoNoApp(notificacao) async {
    // final notificacoesProvider = NotificacaoProvider();
    //_appConfig.appNotificacoes.add(notificacao);
    // notificacoesProvider.saveNotificacao(notificacao);
  }

  void montarNotificacaoDetalhes(NotificacaoResponse notificacao) {
    try {
      if (notificacao.temNotificacao! == true) {
        tituloNotificacao = notificacao.tituloNotificacao;
        mensagemNotificacao = notificacao.mensagemNotificacao;
      }
    } on Exception {
      throw "Nao montou detalhes da notificacao";
    }
  }

  Future agendarNotificacaoDoApp() async {
    NotificacaoResponse notificacao;
    await inicializarNotificacao();
    //notificacao = ajustarDatasExibicoes();
    //erificarSeNotificacaoEstaAtiva(notificacao);

    // if (notificacao.temNotificacao!) {
    //   montarNotificacaoDetalhes(notificacao);
    //   criarNotificacaoCalendario(notificacao);
    //   //criarNotificacaoComAgendamento(notificacao);
    // }
  }

  // NotificacaoResponse ajustarDatasExibicoes() {
  //   int diaAtualApp = DateTime.now().day;
  //   int mesAtual = DateTime.now().month;
  //   DateTime now = DateTime.now();
  //   DateTime dataExibicao;
  //   _appConfig.appNotificacoes.sort(((a, b) {
  //     return -a.dataExibicaoNotificacao!.compareTo(b.dataExibicaoNotificacao!);
  //   }));

  //   for (var notificacao in _appConfig.appNotificacoes) {
  //     dataExibicao = notificacao.dataExibicaoNotificacao!;
  //     notificacao.dataExibicaoNotificacao = DateTime(dataExibicao.year,
  //         mesAtual, diaAtualApp, dataExibicao.hour, dataExibicao.minute);
  //   }

  //   NotificacaoResponse notificacao = _appConfig.appNotificacoes.firstWhere(
  //       (element) => element.dataExibicaoNotificacao!.isAfter(now.toUtc()));

  //   return notificacao;
  // }

  Future verificarSeNotificacaoEstaAtiva(
      NotificacaoResponse notificacao) async {
    DateTime dataInicial = notificacao.dataInicialNotificacao!;
    DateTime dataFinal = notificacao.dataFinalNotificacao!;

    if (dataAtualApp.isAfter(dataInicial) && dataAtualApp.isBefore(dataFinal)) {
      notificacao.temNotificacao = true;
    } else {
      notificacao.temNotificacao = false;
    }
  }

  Future<bool> inicializarNotificacao() {
    try {
      channelNotificacao = "{_appConfig.flavorName}_channel";
      AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
        if (!isAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      });
      return AwesomeNotifications().initialize(null, //'assets/icons/icon.png',
          [
            NotificationChannel(
                channelKey: channelNotificacao,
                channelName: 'Basic notificacoes',
                channelDescription: 'Notification channel for basic tests',
                defaultColor: Get.theme.primaryColor,
                ledColor: Colors.white)
          ]);
    } on Exception {
      throw "Nao enviou notificacao";
    }
  }

  Future<bool> criarNotificacao() {
    try {
      return AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: channelNotificacao,
            title: tituloNotificacao,
            body: mensagemNotificacao,
            color: Get.theme.primaryColor),
      );
    } on Exception {
      throw "Nao criou Awesome Notifications";
    }
  }

  // Future<bool> criarNotificacaoComAgendamento(NotificacaoResponse notificacao) {
  //   try {
  //     return AwesomeNotifications().createNotification(
  //         content: NotificationContent(
  //             id: notificacao.id!,
  //             channelKey: channelNotificacao,
  //             title: tituloNotificacao,
  //             body: mensagemNotificacao,
  //             color: Get.theme.primaryColor),
  //         schedule: NotificationCalendar.fromDate(
  //             date: notificacao.dataExibicaoNotificacao!));
  //   } on Exception {
  //     throw "Nao criou Awesome Notifications com agendamento";
  //   }
  // }

  Future<bool> criarNotificacaoCalendario(NotificacaoResponse notificacao) {
    try {
      return AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: notificacao.id!,
              channelKey: channelNotificacao,
              title: tituloNotificacao,
              body: mensagemNotificacao,
              color: Get.theme.primaryColor),
          schedule: NotificationCalendar(
              hour: notificacao.dataExibicaoNotificacao!.hour,
              minute: notificacao.dataExibicaoNotificacao!.minute,
              repeats: true,
              allowWhileIdle: true,
              preciseAlarm: true,
              timeZone: 'America/Sao_Paulo'));
    } on Exception {
      throw "Nao criou Awesome Notifications com agendamento";
    }
  }
}
