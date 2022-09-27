import 'package:get/get.dart';
import 'package:marmitec/pages/login/login_bindings.dart';
import 'package:marmitec/pages/login/login_page.dart';
import 'route_name.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: RouteName.login,
      page: () => LoginPage(),
      binding: LoginBindings(),
    ),
  ];
}
