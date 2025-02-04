import 'package:flutter/material.dart';

class TextFieldInputModel {
  TextFieldInputModel(
      {required this.context,
      required this.controller,
      required this.textHint,
      this.prefixIcon,
      this.onSuffixIconPressed,
      this.postfixIcon,
      this.isSecure = false});

  final TextEditingController controller;
  final String textHint;
  final bool isSecure;
  final BuildContext context;
  final IconData? prefixIcon;
  final IconData? postfixIcon;
  final VoidCallback? onSuffixIconPressed;
}
