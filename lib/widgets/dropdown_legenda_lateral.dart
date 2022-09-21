import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// não tem label/hint por ser mais baixo, então a legenda fica à esquerda
/// vem com o primeiro item da lista como valor default
class DropdownLegendaLateral<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> lista;
  final Function(T?) onChanged;
  final String texto;
  final double largura;

  const DropdownLegendaLateral(
    this.texto,
    this.lista,
    this.onChanged, {
    this.largura = 120,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(texto),
        const SizedBox(
          width: 15,
        ),
        Container(
          height: 35,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Get.theme.primaryColor.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(5),
          ),
          child: SizedBox(
            height: 35,
            width: largura,
            child: DropdownButtonFormField<T>(
              value: lista.first.value,
              onChanged: onChanged,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 12),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  border: InputBorder.none),
              items: lista,
            ),
          ),
        ),
      ],
    );
  }
}
