import 'package:coaching_app/core/models/text_field_input_model.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

Widget customTextField({required TextFieldInputModel textFieldInputModel}) {
  return TextFormField(
      controller: textFieldInputModel.controller,
      inputFormatters: textFieldInputModel.textInputFormatter,
      validator: textFieldInputModel.validator,
      obscureText: textFieldInputModel.isSecure,
      cursorColor: AppColors.primaryColor,
      
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: AppColors.black),
          ),
        filled: true,
        fillColor: textFieldInputModel.backgroundColor ?? AppColors.white,
          contentPadding: EdgeInsets.all(0),
          hintText: textFieldInputModel.textHint,
          suffixIcon: IconButton(
            icon: Icon(
              textFieldInputModel.postfixIcon,
            ),
            onPressed: textFieldInputModel.onSuffixIconPressed,
            color: AppColors.grey,
          ),
          prefixIcon: Icon(
            textFieldInputModel.prefixIcon,
            color: AppColors.grey,
          ),
          hintStyle: TextStyles.semiBold20(textFieldInputModel.context,
              color: AppColors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: AppColors.grey),
          )));
}
