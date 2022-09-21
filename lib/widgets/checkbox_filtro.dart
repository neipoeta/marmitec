import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckboxPadrao extends StatelessWidget {
  final RxBool valor;
  final String titulo;

  const CheckboxPadrao(
    this.titulo,
    this.valor, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Checkbox(titulo, valor, 20);
  }
}

class _Checkbox extends StatelessWidget {
  final RxBool valor;
  final String titulo;
  final double size;

  const _Checkbox(
    this.titulo,
    this.valor,
    this.size, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(() {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: GestureDetector(
              onTap: () {
                valor.value = !valor.value;
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                decoration: BoxDecoration(
                  color: valor.value
                      ? Colors.yellow
                      : Get.theme.primaryColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(3.0),
                ),
                width: size,
                height: size,
                child: valor.value
                    ? Icon(
                        Icons.close,
                        color: Colors.black,
                        size: size,
                      )
                    : null,
              ),
            ),
          );
        }),
        Text(
          titulo,
          style: TextStyle(color: Get.theme.primaryColor),
        ),
      ],
    );
  }
}
