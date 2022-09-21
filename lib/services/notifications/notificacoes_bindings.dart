import 'package:get/instance_manager.dart';
import 'package:marmitec/services/notifications/notificacoes_controller.dart';

class NotificacoesBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<NotificacoesController>(NotificacoesController(Get.find(),));
  }
}