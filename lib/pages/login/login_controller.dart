import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marmitec/app_config.dart';
import '../../rest/request_models/login_request.dart';
import '../../rest/response_models/login_response.dart';
import '../../rest/services/login_rest_service.dart';
import '../../rest/services/recuperar_senha_rest_service.dart';

class LoginController extends GetxController with StateMixin {
  LoginController(
      this._loginRestService,
      this._recuperarSenhaRestService,);
  final LoginRestService _loginRestService;
  final AppConfig _appConfig = Get.find<AppConfig>();
  final RecuperarSenhaRestService _recuperarSenhaRestService;
  var _busyController = false;

  @override
  Future<void> onInit() async {
    super.onInit();

    try {
      change(null, status: RxStatus.loading());

      // origens = await _origensRestService.buscaTodas(_appConfig.chaveProjeto);

      change(null, status: RxStatus.success());
    } on Exception {
      //GravaErroInesperado()(exception: e, stack: StackTrace.current);

      change(
          'Não foi possível conectar ao servidor, verifique sua conexão com a internet e tente novamente',
          status: RxStatus.error());
    }
  }

  Future logar(documento, senha) async {
    try {
      final LoginRequest loginRequest = LoginRequest(
          'key',
          _appConfig.chaveProjeto,
          documento.text,
          senha.text,
          false,
          'mensagem',
          false,
          'facebook',
          'authId',
          'authToken');

      if (!loginRequest.documento.contains('@')) {
        loginRequest.documento =
            loginRequest.documento.replaceAll(".", "").replaceAll("-", "");
      }

      final login = await _loginRestService.logar(loginRequest);

      await configuraUsuarioApp(login);
    } catch (e) {
      return e.toString();
    }
  }

  bool ehOuroEPrata() {
    if (_appConfig.chaveProjeto == 'E0297E') {
      return true;
    } else {
      return false;
    }
  }


  Future configuraUsuarioApp(LoginResponse login) async{
    //_appConfig.usuarioLogado = login;
    //_appConfig.usuarioLogado!.cep = login.enderecoPrincipal['cep'].toString();

    for (var passageiro in login.passageiros) {
      String nomeComprador = login.nome!.toUpperCase();
      String nomePassageiro = passageiro['nome'].toUpperCase();
      if (nomeComprador.contains(nomePassageiro)) {
        //_appConfig.usuarioLogado!.rg = passageiro['documento'];
      }
    }
  }

  // Future recuperarSenha(documento) async {
  //   try {
  //     final RecuperarSenhaRequest recuperarSenhaRequest =
  //         RecuperarSenhaRequest(_appConfig.chaveProjeto, documento);
  //     final recuperarSenha = await _recuperarSenhaRestService
  //         .recuperarSenha(recuperarSenhaRequest);
  //   } catch (recuperarSenha) {
  //     Get.snackbar('E-mail enviado com sucesso!', recuperarSenha.toString());
  //   }
  // }

  // Future verificaSeUserSalvoLocal() async {
  //   final cp = ClienteProvider();
  //   LoginResponse cli = await cp.verificaSeTemClienteSalvo();
  //   if (cli.senhaCliente != null) {
  //     logar(_appConfig.usuarioLogado?.numeroDocumento,
  //             _appConfig.usuarioLogado?.senhaCliente)
  //         .then((response) {});
  //   }
  // }

  String ajusteLoginEspaco(String login) {
    String loginNovo = login.replaceAll(" ", "");
    return loginNovo;
  }

  // void validaUsuarioLogado() async {
  //   if (_appConfig.usuarioLogado != null) {
  //     NavigationManager.voltar();
  //     NavigationManager.navegarPara(Rotas.buscaPassagemPage);
  //   } else {
  //     Get.offNamed('/login');
  //   }
  // }

  void usuarioInvalido(context) async {
    await showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          title: const Text("Atenção"),
          content: const Text(
              "Não foi possível realizar o login. Verifique se os dados informados estão corretos."),
          actions: <Widget>[
            ButtonBar(
              children: <Widget>[
                ElevatedButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void updateClientecontroller(LoginResponse cliente) {
    if (cliente == null) {
      //ClienteProvider().cleanClienteTable();
    }
  }

  bool get estaOcupada => _busyController ? true : false;
  void ocupar() {
    if (!_busyController) {
      _busyController = true;
    }
  }

  void liberar() {
    if (_busyController) {
      _busyController = false;
    }
  }
}
