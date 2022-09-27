import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marmitec/controllers/login_controller.dart';
import 'package:ndialog/ndialog.dart';
import '../../app_config.dart';
import '../../widgets/drawer_padrao.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  //final AppConfig _appConfig = Get.find<AppConfig>();
  late ProgressDialog progressDialog;

  @override
  Widget build(BuildContext context) {
    final skaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: skaffoldKey,
        appBar: AppBar(
          title: const Text('_appConfig.appName'),
        ),
        drawer: DrawerPadrao(true),
        backgroundColor: const Color.fromARGB(255, 227, 241, 255),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 3.0, color: Color.fromARGB(255, 125, 154, 201)),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => {
                              //NavigationManager.navegarPara(Rotas.cadastroPage)
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 50),
                              child: const Text(
                                'Cadastro',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 118, 149, 198),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                      child: Divider(
                        height: 1,
                        color: Color.fromARGB(255, 118, 149, 198),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 15),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                            'Faça seu login e tenha acesso a Área do Cliente',
                            style: TextStyle(
                              fontSize: 16,
                            )),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 15.0, vertical: 8),
                    //   child: TextFormFieldPadrao(
                    //     ' E-mail / CPF / CNPJ ',
                    //     _loginController,
                    //     textSenha: false,
                    //     textSenhaAutocorrect: true,
                    //     textSenhaSuggestions: true,
                    //   ),
                    //),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 15.0, vertical: 8),
                    //   child: TextFormFieldPadrao(
                    //     ' Senha ',
                    //     _senhaController,
                    //     textSenha: true,
                    //     textSenhaAutocorrect: false,
                    //     textSenhaSuggestions: false,
                    //   ),
                    // ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 8),
                        child: GestureDetector(
                          child: const Text(
                            'Esqueci minha senha',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                          onTap: () async {
                            if (_loginController.text.length < 6) {
                              showDialog(
                                context: context,
                                builder: (c) {
                                  return AlertDialog(
                                    title: const Text("Atenção"),
                                    content: const Text(
                                        "Informe o E-mail/Cpf/Cpnj para recuperar a senha."),
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
                            } // else {
                            //   controller.ocupar();
                            //   controller
                            //       .recuperarSenha(_loginController.text)
                            //       .then(
                            //     (onData) async {
                            //       controller.liberar();
                            //       showDialog(
                            //         context: context,
                            //         builder: (c) {
                            //           return AlertDialog(
                            //             title: const Text("Atenção"),
                            //             content: const Text(
                            //                 "Foi enviado para o seu e-mail os dados para recuperação de senha."),
                            //             actions: <Widget>[
                            //               ButtonBar(
                            //                 children: <Widget>[
                            //                   ElevatedButton(
                            //                     child: const Text("Ok"),
                            //                     onPressed: () {
                            //                       Navigator.pop(context);
                            //                     },
                            //                   ),
                            //                 ],
                            //               ),
                            //             ],
                            //           );
                            //         },
                            //       );
                            //     },
                            //   ).catchError(
                            //     (onError) async {
                            //       controller.liberar();
                            //       showDialog(
                            //         context: context,
                            //         builder: (c) {
                            //           return AlertDialog(
                            //             title: const Text("Atenção"),
                            //             content: Text(onError.message),
                            //             actions: <Widget>[
                            //               ButtonBar(
                            //                 children: <Widget>[
                            //                   ElevatedButton(
                            //                     child: const Text("Ok"),
                            //                     onPressed: () {
                            //                       Navigator.pop(context);
                            //                     },
                            //                   ),
                            //                 ],
                            //               ),
                            //             ],
                            //           );
                            //         },
                            //       );
                            //     },
                            //   );
                            // }
                          },
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 15.0, vertical: 5),
                    //   child: BotaoPreenchido(
                    //     'Entrar',
                    //     () async => {
                    //       await _login(context),
                    //     },
                    //     botaoPreenchidoAltura: BotaoPreenchidoAltura.baixa,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          const Text('Primeiro Acesso?'),
                          GestureDetector(
                            onTap: () => {
                              //NavigationManager.navegarPara(Rotas.cadastroPage),
                            },
                            child: const Text('Clique Aqui',
                                style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future _login(BuildContext context) async {
  //   progressDialog = ProgressDialog(
  //     context,
  //     blur: 0,
  //     dialogTransitionType: DialogTransitionType.Shrink,
  //     message: const Text("Carregando..."),
  //     title: null,
  //   );
  //   progressDialog.show();
  //   await Future.delayed(const Duration(seconds: 2));
  //   await controller.logar(_loginController, _senhaController);
  //   progressDialog.dismiss();
  //   if (_appConfig == null) {
  //     //controller.usuarioInvalido(context);
  //   } else {
  //     var snackBar = const SnackBar(
  //       elevation: 0,
  //       behavior: SnackBarBehavior.floating,
  //       backgroundColor: Color.fromARGB(255, 118, 149, 198),
  //       content: Text('Login realizado com sucesso.\nBem vindo, Nei!'),
  //     );
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     //controller.validaUsuarioLogado();
  //   }
  // }
}