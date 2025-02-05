import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldInputModel {
  TextFieldInputModel(
      {required this.context,
      required this.controller,
      required this.textHint,
      this.textInputFormatter,
      this.prefixIcon,
      this.onSuffixIconPressed,
      this.validator,
      this.postfixIcon,
      this.isSecure = false});

  final TextEditingController controller;
  final String textHint;
  final bool isSecure;
  final BuildContext context;
  final IconData? prefixIcon;
  final IconData? postfixIcon;
  final VoidCallback? onSuffixIconPressed;
  final List<TextInputFormatter>? textInputFormatter;
  final FormFieldValidator<String>? validator;
}
