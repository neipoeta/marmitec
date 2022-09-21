import 'dart:async';
import 'package:flutter/widgets.dart';

class CicloApp extends StatefulWidget {
  const CicloApp({Key? key}) : super(key: key);

  @override
  State<CicloApp> createState() => _CicloAppState();
}

class _CicloAppState extends State<CicloApp> with WidgetsBindingObserver {
  bool timer = false;
  AppLifecycleState? _lastLifecycleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    await chamarObtemNotificacoes();
    final isBackground = state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached;

    if (isBackground) {
      Timer.periodic(const Duration(hours: 1), (timer) async {
        if (isBackground) {
          await chamarObtemNotificacoes();
        }
      });
    }

    setState(() {
      _lastLifecycleState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Text('');
  }

  Future chamarObtemNotificacoes() async {
    // final noti = NotificacaoProvider();
    // await NotificacoesController(Get.find()).obterNotificacaoApi();
    // await noti.verificaSeTemNotificacaoSalvo();
    // await NotificacoesController(Get.find()).agendarNotificacaoDoApp();
  }
}
