import 'package:get/get.dart';

import '../login_rest.dart';
import '../request_models/login_request.dart';
import '../response_models/login_response.dart';

class LoginRestService extends GetxService {
  final LoginRest _loginRest;
  LoginRestService(this._loginRest);

  Future<LoginResponse> logar(LoginRequest loginRequest) async {
    var result = await _loginRest.logar(loginRequest);
    return result;
  }
}
