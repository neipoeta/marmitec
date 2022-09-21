import 'package:get/instance_manager.dart';
import 'package:marmitec/services/ciclo_app/ciclo_app_controller.dart';

class CicloAppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<CicloApp>(const CicloApp());
  }
}