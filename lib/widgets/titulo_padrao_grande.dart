import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TituloPadraoGrande extends StatelessWidget {
  final String titulo;

  const TituloPadraoGrande(
    this.titulo, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(titulo,
        style: TextStyle(
            color: Get.theme.primaryColor,
            fontSize: 22,
            fontWeight: FontWeight.bold));
  }
}
