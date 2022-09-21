import 'package:get/get.dart';

import 'cliente_controller.dart';

class ClienteBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ClienteController());
  }
}
