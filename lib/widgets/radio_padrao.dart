import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioPadrao<T> extends StatelessWidget {
  const RadioPadrao({
    required this.valorExibido,
    required this.valorSelecionado,
    required this.texto,
    Key? key,
  }) : super(key: key);

  final T valorExibido;
  final Rx<T> valorSelecionado;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => Radio<T>(
              visualDensity: VisualDensity.compact,
              value: valorExibido,
              groupValue: valorSelecionado.value,
              onChanged: (v) {
                if (v != null) {
                  valorSelecionado.value = v;
                }
              }),
        ),
        Text(texto),
      ],
    );
  }
}
