import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TituloPadraoPequeno extends StatelessWidget {
  final String titulo;
  final Color? cor;
  const TituloPadraoPequeno(
    this.titulo, {
    this.cor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      style: TextStyle(
          fontSize: 16,
          color: cor ?? Get.theme.primaryColor,
          fontWeight: FontWeight.bold),
    );
  }
}
