import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../app_config.dart';
import '../../services/ciclo_app/ciclo_app_controller.dart';
import '../../widgets/drawer_padrao.dart';
import '../../widgets/titulo_padrao.dart';
import 'empresa_controller.dart';

class EmpresaPage extends GetView<EmpresaController> {
  String urlHorarios = '';

  final AppConfig _appConfig = Get.find<AppConfig>();

  @override
  Widget build(BuildContext context) {
    var skaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 227, 241, 255),
        key: skaffoldKey,
        appBar: AppBar(
          title: Text(_appConfig.appName),
        ),
        // endDrawer: CarrinhoDrawerPage(),
        drawer: DrawerPadrao(false),
        body: controller.obx(
          (state) {
            return SingleChildScrollView(
              reverse: true,
              child: Container(
                margin: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    const CicloApp(),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0)),
                      child:
                          const TituloPadrao('Compre sua passagem de ônibus!'),
                    ),
                    Container(
                      decoration: const BoxDecoration(color: Colors.white),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0)),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Saindo de',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Indo para',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Stack(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: const [
                                
                                    
                                
                                
                                
                                SizedBox(
                                  width: 15,
                                ),
                                
                                    
                                  
                                
                                
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(color: Colors.white),
                   
                        
                      
                    ),
                    Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Column(
                          children: const [
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 10.0),
                            ),
                            Divider(height: 8),
                            Visibility(
                              visible:
                                  false, //Todo _appConfig.usuarioLogado == null ? false : true,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          onError: (v) => ErroWidget(
            mensagem: v,
            onPressed: controller.onInit,
          ),
        ),
      ),
    );
  }
}

class ErroWidget extends StatelessWidget {
  const ErroWidget({
    required this.onPressed,
    Key? key,
    this.mensagem,
  }) : super(key: key);

  final String? mensagem;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            mensagem ?? 'Um erro inesperado ocorreu',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
