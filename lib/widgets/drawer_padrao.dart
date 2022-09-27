import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ndialog/ndialog.dart';


class DrawerPadrao extends StatelessWidget {
  bool telaHome;

  DrawerPadrao(this.telaHome, {Key? key}) : super(key: key);
  //final AppConfig _appConfig = Get.find<AppConfig>();
  final double padding = 8.0;
  String urlSiteVIOP =
      'https://homologacao.passagensweb.com.br/_esipe_geral/PoliticaDePrivacidade/E0297.pdf';
  String urlSiteUnesul = 'https://ecommerce-hml-unesul.passagensweb.com.br/';
  String urlPoliticaDePrivacidadeFinal = '';

  @override
  Widget build(BuildContext context) {
    ProgressDialog progressDialog = ProgressDialog(
      context,
      blur: 0,
      dialogTransitionType: DialogTransitionType.Shrink,
      message: const Text("Carregando..."),
      title: null,
    );
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 10, top: 10),
                      child: Container(
                          padding: null,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Olá, Cliente',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 73, 135),
                                ),
                              ),
                              Visibility(
                                  visible: true,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  )),
                            ],
                          ))),
                  Divider(
                    color: Get.theme.primaryColor.withOpacity(0),
                  ),
                  DivisorDrawer(),
                  InkWell(
                    splashColor: Get.theme.primaryColor.withOpacity(0.4),
                    onTap: () {
                      //NavigationManager.voltar();
                      //NavigationManager.navegarPara(Rotas.comprasPage);
                    },
                    child: const SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Text('Minhas Compras'),
                      ),
                    ),
                  ),
                  DivisorDrawer(),
                  InkWell(
                    splashColor: Get.theme.primaryColor.withOpacity(0.4),
                    onTap: () {
                      //NavigationManager.voltar();
                      //NavigationManager.navegarPara(Rotas.dadosDoUsuarioPage);
                    },
                    child: const SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Text('Dados do Usuário'),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: Column(
                      children: [
                        DivisorDrawer(),
                        GestureDetector(
                          onTap: () {
                            //NavigationManager.navegarPara(
                                //Rotas.passageirosPage);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(padding),
                            child: const Text('Meus Passageiros'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DivisorDrawer(),
                  InkWell(
                    highlightColor: Get.theme.primaryColor.withOpacity(0.4),
                    onTap: () async {
                      progressDialog.show();
                      //await geraPdfUrl();
                      if (progressDialog.isShowed) {
                        Get.back();
                      }
                    },
                    child: const SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Text(
                          'Política de Privacidade',
                        ),
                      ),
                    ),
                  ),
                  DivisorDrawer(),
                  InkWell(
                    splashColor: Get.theme.primaryColor.withOpacity(0.4),
                    onTap: () {
                      //NavigationManager.voltar();
                      //sairApp();
                    },
                    child: const SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Text(
                          'Sair',
                        ),
                      ),
                    ),
                  ),
                  DivisorDrawer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // sairApp() {
  //   _appConfig.tempoCompras = '';
  //   //NavigationManager.voltar();
  //   //NavigationManager.navegarPara(Rotas.loginPage);
  // }

  Widget DivisorDrawer() {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        color: Get.theme.primaryColor.withOpacity(0.4),
      ),
    );
  }

}
