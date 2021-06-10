import 'package:flutter/material.dart';

class FormFieldText extends StatelessWidget {
  final String? hintText;
  final bool obscure;
  final TextEditingController? textEditingController;
  dynamic validation;
  FormFieldText({
    this.hintText,
    this.obscure = false,
    this.textEditingController,
    this.validation,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
      ),
      validator: validation,
    );
  }
}
