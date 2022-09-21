
// ignore_for_file: always_put_control_body_on_new_line, prefer_is_empty, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//String _select = "";
class FormularioItem {
  int hashCodeController;
  bool valido;
  String label;
  String textWrited;
  String validationReturn;
  FormularioItem(
      {required this.hashCodeController,
      required this.valido,
      required this.label,
      required this.textWrited,
      required this.validationReturn});
}

class FormularioValido {
  List<FormularioItem> lstFields = [];
  bool firstTime = true;

  bool add(int hash, bool valido, String label, String textWrited,
      String validationReturn) {
    if ((lstFields.any((x) => x.label == label) ||
            lstFields.any((x) => x.hashCode == hash)) ==
        false) {
      FormularioItem fi = FormularioItem(
          hashCodeController: hash, valido: valido, label: label, validationReturn: '', textWrited: '');
      lstFields.add(fi);
      return true;
    }
    return false;
  }

  void remove(int hash) {
    lstFields.removeWhere((element) => element.hashCodeController == hash);
    for (var element in lstFields) {
      print(element.hashCode);
    }
  }

  void validaCampo(int hash, bool valido, String label, String textWrited,
      String validationReturn) {
    print(
        "${DateTime.now()} atualizando: $hash || label: $label || valor $textWrited || válido: $valido");
    if (lstFields.any((x) => x.label == label)) {
      lstFields.firstWhere((x) => x.label == label).valido = valido;
      lstFields.firstWhere((x) => x.label == label).label = label;
      lstFields.firstWhere((x) => x.label == label).hashCodeController = hash;
      lstFields.firstWhere((x) => x.label == label).textWrited = textWrited;
    } else if (lstFields.any((x) => x.hashCode == hash)) {
      lstFields.firstWhere((x) => x.hashCode == hash).valido = valido;
      lstFields.firstWhere((x) => x.hashCode == hash).label = label;
      lstFields.firstWhere((x) => x.label == label).hashCodeController = hash;
      lstFields.firstWhere((x) => x.label == label).textWrited = textWrited;
    }
  }

  bool formuIsValid() {
    if (lstFields.length == 0) return false;
    return !lstFields.any((x) => x.valido == false);
  }

  List<String> showErrorsField() {
    return lstFields
        .where((x) => x.valido == false)
        .map(
          (f) => f.label,
        )
        .toList();
  }

  bool idFirstTime() {
    return firstTime;
  }
}

TextInputAction? getInputAction(BuildContext context) {
  switch (Theme.of(context).platform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
      return TextInputAction.next;
      
    case TargetPlatform.iOS:
      return TextInputAction.next;
    default:
      return null;
  }
}

Function(String) removeFocus(BuildContext context) {
  return (v) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  };
}

Widget buildFormItemCustom(
    {Icon? prefix,
    Icon? suffix,
    String? label,
    String? hint,
    bool? editavel,
    int? maxLength,
    bool? obscureText,
    FormularioValido? validacao,
    TextInputType? keyboardType,
    TextEditingController? controller,
    Function(String)? validator,
    FocusNode? node,
    BuildContext? context}) {
  final novo = validacao?.add(
      controller.hashCode,
      validator!(controller!.value.text) != null ? false : true,
      label!,
      "inicio",
      "inicio");

  if (novo != null) {
    controller?.addListener(() {
      validacao?.validaCampo(
          controller.hashCode,
          validator!(controller.value.text) != null ? false : true,
          label!,
          controller.value.text,
          validator(controller.value.text));
      print(
          "${DateTime.now()} Listener controller: label: $label || valor ${controller.value.text}|| válido: ${validator!(controller.value.text) != null ? false : true}");
    });
  }

  return Column(
    children: <Widget>[
      StreamBuilder<bool>(
          stream: validator!(controller!.value.text) != null
              ? Stream.fromFuture(Future.value(false))
              : Stream.fromFuture(Future.value(true)),
          builder: (context, snapshot) {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: prefix ?? Container(),
                    ),
                    Expanded(
                      child: TextField(
                        focusNode: node,
                        enabled: editavel ?? true,
                        textInputAction: getInputAction(context),
                        onSubmitted: removeFocus(context),
                        onEditingComplete: () {
                          SystemChannels.textInput
                              .invokeMethod('TextInput.hide');
                        },
                        controller: controller,
                        keyboardType: keyboardType ?? TextInputType.text,
                        maxLength: maxLength,
                        obscureText: obscureText ?? false,
                        decoration: InputDecoration(
                            labelText: label,
                            hintText: hint,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 17, horizontal: 12),
                            labelStyle: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 73, 135),
                            ),
                            counterStyle: const TextStyle(fontSize: 0, height: 0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Color.fromARGB(255, 118, 149, 198)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(width: 2, color: Color.fromARGB(255, 118, 149, 198)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(width: 1, color: Color.fromARGB(255, 118, 149, 198)),
                              borderRadius: BorderRadius.circular(4),
                            ),),
                      ),
                    ),
                  ],
                ),
                Container(),

              ],
            );
          }),
      suffix ?? Container(),
    ],
  );
}