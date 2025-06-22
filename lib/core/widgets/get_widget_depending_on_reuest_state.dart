import 'package:coaching_app/core/utils/enums.dart';
import 'package:flutter/material.dart';

Widget getWidgetDependingOnReuestState(
    {required RequestStateEnum requestStateEnum,
    required Widget widgetIncaseSuccess,
    required String? erorrMessage}) {
  switch (requestStateEnum) {
    case RequestStateEnum.success:
      return widgetIncaseSuccess;
    case RequestStateEnum.failed:
      return Center(child: Text(erorrMessage!));
    case RequestStateEnum.loading:
      return Padding(
        padding: const EdgeInsets.all(50),
        child: CircularProgressIndicator(),
      );
  }
}
