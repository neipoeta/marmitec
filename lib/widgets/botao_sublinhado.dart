import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BotaoSublinhado extends StatelessWidget {
  final String titulo;
  final Function()? onTap;

  const BotaoSublinhado(
    this.titulo,
    this.onTap, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: onTap,
        child: Text(
          titulo,
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: Get.theme.primaryColor.withOpacity(0.4)),
        ),
      ),
    );
  }
}
