import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:marmitec/controllers/login_controller.dart';
import 'package:ndialog/ndialog.dart';
import '../../utils/constantes.dart';
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
        drawer: DrawerPadrao(true),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.fill,
                opacity: 1),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Marmitec',
                      style: TextStyle(
                        color: Color.fromARGB(255, 201, 201, 203),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: AnnotatedRegion<SystemUiOverlayStyle>(
                  value: SystemUiOverlayStyle.light,
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(45),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(255, 57, 60, 65),
                                Color.fromARGB(255, 51, 58, 71),
                                Color.fromARGB(255, 73, 85, 100),
                                Color.fromARGB(255, 81, 102, 122),
                              ],
                              stops: [0.1, 0.4, 0.7, 0.9],
                            ),
                          ),
                          child: SizedBox(
                            height: double.infinity,
                            child: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40.0,
                                vertical: 5.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Email',
                                    style: kLabelStyle,
                                  ),
                                  const SizedBox(height: 5.0),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    alignment: Alignment.centerLeft,
                                    decoration: kBoxDecorationStyle,
                                    height: 50.0,
                                    child: const TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'OpenSans',
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(top: 14.0),
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Colors.white,
                                        ),
                                        hintText: 'Enter your Email',
                                        hintStyle: kHintTextStyle,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Text(
                                        'Password',
                                        style: kLabelStyle,
                                      ),
                                      const SizedBox(height: 5.0),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        decoration: kBoxDecorationStyle,
                                        height: 50.0,
                                        child: const TextField(
                                          obscureText: true,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'OpenSans',
                                          ),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.only(top: 14.0),
                                            prefixIcon: Icon(
                                              Icons.lock,
                                              color: Colors.white,
                                            ),
                                            hintText: 'Enter your Password',
                                            hintStyle: kHintTextStyle,
                                          ),
                                        ),
                                      ),
                                    ],
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
                                          vertical: 16.0),
                                      child: GestureDetector(
                                        child: const Text(
                                          'Esqueci minha senha',
                                          style: kLabelStyle,
                                        ),
                                        onTap: () async {
                                          if (_loginController.text.length <
                                              6) {
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
                                                          child:
                                                              const Text("Ok"),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
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
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 25.0),
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () =>
                                          print('Login Button Pressed'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        padding: const EdgeInsets.all(15.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                      child: const Text(
                                        'LOGIN',
                                        style: TextStyle(
                                          color: Color(0xFF527DAA),
                                          letterSpacing: 1.5,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        print('Sign Up Button Pressed'),
                                    child: RichText(
                                      text: const TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Primeiro Acesso? ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Cadastre-se ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
