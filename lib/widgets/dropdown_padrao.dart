import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownPadrao<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> lista;
  final Function(T?) onChanged;
  final String? texto;
  final String? Function(T?)? validador;
  final T? itemSelec;

  const DropdownPadrao(
    this.texto,
    this.lista,
    this.onChanged, {
    this.validador,
    Key? key,
    this.itemSelec,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Get.theme.primaryColor.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: SizedBox(
        child: DropdownButtonFormField<T>(
          value: itemSelec ?? lista.first.value,
          onChanged: onChanged,
          validator: validador,
          decoration: const InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              border: InputBorder.none),
          items: lista,
        ),
      ),
    );
  }
}
