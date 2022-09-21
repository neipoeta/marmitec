import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarraSuperiorSelecaoPoltronas extends StatelessWidget {
  final Widget child;
  const BarraSuperiorSelecaoPoltronas({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Column(
            children: [
              Container(
                height: 20,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BarraHorizontalMenor(),
                    Expanded(child: Container()),
                    const BarraHorizontalMenor(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Container(
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          height: 40,
          decoration: BoxDecoration(
            color: Get.theme.primaryColor.withOpacity(0.2),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                        vertical: BorderSide(
                            color: Get.theme.primaryColor.withOpacity(0.2),
                            width: 3)),
                  ),
                  child: child),
              Divider(
                  color: Get.theme.primaryColor.withOpacity(0.2),
                  height: 3,
                  thickness: 3),
            ],
          ),
        ),
      ],
    );
  }
}

class BarraHorizontalMenor extends StatelessWidget {
  const BarraHorizontalMenor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.primaryColor.withOpacity(0.3),
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
      ),
      width: 50,
      height: 10,
    );
  }
}
