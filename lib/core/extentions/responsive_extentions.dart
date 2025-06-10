import 'package:flutter/material.dart';

extension ResponsiveExtention on BuildContext {
  double get heightReponsive => MediaQuery.of(this).size.height;
  double get widthResponsive => MediaQuery.of(this).size.width;
}
