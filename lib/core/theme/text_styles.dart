import 'package:coaching_app/core/helper_function/get_responsive_font_size.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle customFontForCap(
    BuildContext context,
  ) {
    return TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: getResponsiveFontSize(context: context, fontSize: 20),
        height: 1.5, // 150%
        fontFamily: 'serif');
  }

  static TextStyle semiBold16(BuildContext context, {required Color color}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
      fontSize: getResponsiveFontSize(context: context, fontSize: 16),
      height: 1.5, // 150%
    );
  }

  static TextStyle regular12(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,

      fontSize: getResponsiveFontSize(context: context, fontSize: 12),
      height: 1.2, // 120%
    );
  }

  static TextStyle semiBold14_150(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,

      fontSize: getResponsiveFontSize(context: context, fontSize: 14),
      height: 1.5, // 150%
    );
  }

  static TextStyle regular14_150(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,

      fontSize: getResponsiveFontSize(context: context, fontSize: 14),
      height: 1.5, // 150%
    );
  }

  static TextStyle semiBold18({required BuildContext context, required Color color}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,

      fontSize: getResponsiveFontSize(context: context, fontSize: 18),
      height: 1.5, // 150%
    );
  }
   static TextStyle quarterBold18({required BuildContext context, required Color color}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,

      fontSize: getResponsiveFontSize(context: context, fontSize: 18),
      height: 1.5, // 150%
    );
  }

  static TextStyle semiBold8(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,

      fontSize: getResponsiveFontSize(context: context, fontSize: 8),
      height: 1.5, // 150%
    );
  }

  static TextStyle semiBold16_120(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,

      fontSize: getResponsiveFontSize(context: context, fontSize: 16),
      height: 1.2, // 120%
    );
  }

  static TextStyle regular14_120(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,

      fontSize: getResponsiveFontSize(context: context, fontSize: 14),
      height: 1.2, // 120%
    );
  }

  static TextStyle light12(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.italic,

      fontSize: getResponsiveFontSize(context: context, fontSize: 12),
      height: 1.5, // 150%
    );
  }

  static TextStyle semiBold20(BuildContext context, {required Color color}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,

      fontSize: getResponsiveFontSize(context: context, fontSize: 20),
      height: 1.5, // 150%
    );
  }

  static TextStyle semiBold14auto(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,

      fontSize: getResponsiveFontSize(context: context, fontSize: 14),
      height: null, // Auto
    );
  }

  static TextStyle semiBold32auto(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,

      fontSize: getResponsiveFontSize(context: context, fontSize: 32),
      height: null, // Auto
    );
  }

  static TextStyle semiBold32(BuildContext context, {required Color color}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,

      fontSize: getResponsiveFontSize(context: context, fontSize: 32),
      height: 1.5, // 150%
    );
  }
  static TextStyle quarterBold32(BuildContext context, {required Color color}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,

      fontSize: getResponsiveFontSize(context: context, fontSize: 32),
      height: 1.5, // 150%
    );
  }
   static TextStyle quarterBold25(BuildContext context, {required Color color}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,

      fontSize: getResponsiveFontSize(context: context, fontSize: 25),
      height: 1.5, // 150%
    );
  }

  static TextStyle regular16_120(BuildContext context, {required Color color}) {
    return TextStyle(
      color: color,
      fontStyle: FontStyle.italic,

      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(fontSize: 16, context: context),
      height: 1.2, // 120%
    );
  }

  static regular14(BuildContext context, {required Color color}) {}
}
