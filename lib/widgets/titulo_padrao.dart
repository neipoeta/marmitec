import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TituloPadrao extends StatelessWidget {
  final String titulo;

  const TituloPadrao(
    this.titulo, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(titulo,
        style: TextStyle(
            color: Get.theme.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold));
  }
}
