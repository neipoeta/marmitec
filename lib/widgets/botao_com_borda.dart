import 'package:flutter/material.dart';

class BotaoComBorda extends StatelessWidget {
  final String texto;
  final Color corFundo;
  final Color corTexto;
  final void Function()? onPressed;

  const BotaoComBorda(
    this.texto, {
    this.corFundo = Colors.transparent,
    this.corTexto = Colors.black,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(texto, style: TextStyle(color: corTexto)),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: corTexto,
              width: 3,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
