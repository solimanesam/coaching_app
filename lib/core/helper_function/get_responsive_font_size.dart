
import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:flutter/cupertino.dart';

double getResponsiveFontSize(
    {required BuildContext context, required double fontSize}) {
  double scaleFactor = getScaleFactor(context: context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor({required BuildContext context}) {
  if (context.widthResponsive < 600) {
    return context.widthResponsive / 400;
  } else if (context.widthResponsive < 900) {
    return context.widthResponsive / 700;
  } else {
    return context.widthResponsive / 1000;
  }
}
