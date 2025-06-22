import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldInputModel {
  TextFieldInputModel(
      {required this.context,
      required this.controller,
      required this.textHint,
      this.textInputFormatter,
      this.backgroundColor,
      this.prefixIcon,
      this.onSuffixIconPressed,
      this.validator,
      this.postfixIcon,
      this.keyBoardType,
      this.isSecure = false});

  final TextEditingController controller;
  final String textHint;
  final bool isSecure;
  final Color? backgroundColor;
  final BuildContext context;
  final IconData? prefixIcon;
  final IconData? postfixIcon;
  final VoidCallback? onSuffixIconPressed;
  final List<TextInputFormatter>? textInputFormatter;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyBoardType;
}
