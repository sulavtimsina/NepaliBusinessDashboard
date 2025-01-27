import 'package:flutter/material.dart';
import 'package:nepalibussiness/utils/utils.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.controllerText});

  final String labelText;
  final String hintText;
  final TextEditingController controllerText;

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils();
    return TextFormField(
        controller: controllerText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: utils.textColor),
          hintText: hintText,
          hintStyle: TextStyle(color: utils.textColor),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: utils.textColor),
          ),
        ));
  }
}
