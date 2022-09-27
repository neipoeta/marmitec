import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marmitec/app_config.dart';
import 'package:marmitec/widgets/drawer_padrao.dart';
import '../../widgets/dropdown_padrao.dart';
import 'cadastro_controller.dart';

class CadastroPage extends GetView<CadastroController> {
  CadastroPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  //final AppConfig _appConfig = Get.find<AppConfig>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('_appConfig.appName'),
      ),
      // endDrawer: CarrinhoDrawerPage(),
      drawer: DrawerPadrao(true),
      backgroundColor: const Color.fromARGB(255, 227, 241, 255),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
            reverse: false,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 3.0, color: Color.fromARGB(255, 125, 154, 201)),
                ),
                color: Colors.white,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => {
                              //NavigationManager.navegarPara(Rotas.loginPage)
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 15),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 118, 149, 198),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 50),
                            child: const Text(
                              'Cadastro',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 6),
                      margin: const EdgeInsets.only(left: 15),
                      child: const Text(
                        'Faça seu cadastro em poucos segundos',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 21, bottom: 5, top: 10),
                        child: Text('Tipo Documento',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 73, 135),
                            )),
                      ),
                    ),
                    controller.obx((state) => Obx(
                          () => Column(
                            children: [
                              Visibility(
                                visible: true,//_tipoDocumentoController.text == 'CPF' ? controller.tipoCliente.value = false : true,
                                child: Column(
                                  children: const [
                                    
                         
                                  ],
                                ),
                              ),
                              
                              
                            ],
                          ),
                        )),
                    
                    
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 21, bottom: 5, top: 10),
                        child: Text('Tipo de Contato',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 73, 135),
                            )),
                      ),
                    ),
                    controller.obx((state) => Obx(
                          () {
                            //var tipoContato = controller.tipoContato;
                            return Column(
                              children: [
                               
                                
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  margin: const EdgeInsets.only(left: 15),
                                  child: const Text(
                                    'Endereço',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              
                               
                              
                               
                                // Visibility(
                                //   visible: true,
                                //   child: Padding(
                                //     padding: const EdgeInsets.symmetric(
                                //         horizontal: 15.0, vertical: 8),
                                //     child: DropdownPadrao(
                                //       '',
                                //       _appConfig.cidades
                                //           .map((e) => DropdownMenuItem(
                                //                 value: e,
                                //                 child: Text(e),
                                //               ))
                                //           .toList(),
                                //       (v) => controller.cidadeClienteController
                                //           .text = v.toString(),
                                //     ),
                                //   ),
                                // ),
                                
                              ],
                            );
                          },
                        )),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 21, bottom: 5, top: 10),
                        child: Text('Receber e-mail promocial',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 73, 135),
                            )),
                      ),
                    ),
                    
                    
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 20),
                      
                        //botaoPreenchidoAltura: BotaoPreenchidoAltura.baixa,
                      ),
                    
                  ],
                ),
              ),
            )),
      ),
    ));
  }

  int verificaCep() {
    if (controller.cepClienteController.text == '') {
      return 0;
    } else {
      return int.parse(
          controller.cepClienteController.text.replaceAll("-", ""));
    }
  }
}
