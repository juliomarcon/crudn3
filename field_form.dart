import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FieldForm extends StatelessWidget {
  String label;
  bool isSenha;
  TextEditingController controller;

  FieldForm(
      {required this.label,
      required this.isSenha,
      required this.controller,
      super.key});

  @override
  Widget build(BuildContext coxtext) {
    return TextFormField(
        obscureText: isSenha,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: label,
        ));
  }
}
