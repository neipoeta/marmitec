import 'package:get/get.dart';
import 'empresa_controller.dart';

class EmpresaBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(EmpresaController());
  }
}
